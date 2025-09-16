#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const SUMMARY_FILE = 'docs/bmad/summary.json';
const TEMPLATE_DIR = 'form-system/fallback-templates';
const OUTPUT_DIR = 'docs/templates';
const MAP_FILE = 'form-system/map.yaml';

function fillTemplates() {
  console.log('📝 Filling professional templates with BMAD data...');

  try {
    // Load BMAD summary data
    if (!fs.existsSync(SUMMARY_FILE)) {
      throw new Error(`BMAD summary not found: ${SUMMARY_FILE}`);
    }

    const summary = JSON.parse(fs.readFileSync(SUMMARY_FILE, 'utf8'));

    // Get template list from map
    const mapContent = fs.readFileSync(MAP_FILE, 'utf8');
    const templateFiles = mapContent.match(/[a-z-]+\.md/g) || [];

    console.log(`📋 Processing ${templateFiles.length} professional templates...`);

    // Ensure output directory exists
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });

    let processedCount = 0;

    templateFiles.forEach(templateFile => {
      const templatePath = path.join(TEMPLATE_DIR, templateFile);
      const outputPath = path.join(OUTPUT_DIR, templateFile);

      if (fs.existsSync(templatePath)) {
        // Read base template
        let templateContent = fs.readFileSync(templatePath, 'utf8');

        // Enhance template with BMAD data
        const enhancedContent = enhanceTemplate(templateFile, templateContent, summary);

        // Write filled template
        fs.writeFileSync(outputPath, enhancedContent);
        processedCount++;
      } else {
        console.warn(`⚠️  Template not found: ${templatePath}`);
      }
    });

    console.log(`✅ Generated ${processedCount} professional documents in docs/templates/`);
    console.log(`📁 Template docs filled with BMAD agent analysis`);

  } catch (error) {
    console.error('❌ Template filling failed:', error.message);
    console.log('📋 Creating minimal templates as fallback...');

    // Fallback: copy templates without enhancement
    const templateFiles = fs.readdirSync(TEMPLATE_DIR).filter(f => f.endsWith('.md'));
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });

    templateFiles.forEach(file => {
      const source = path.join(TEMPLATE_DIR, file);
      const dest = path.join(OUTPUT_DIR, file);
      fs.copyFileSync(source, dest);
    });

    console.log(`📄 Copied ${templateFiles.length} fallback templates`);
  }
}

function enhanceTemplate(filename, content, summary) {
  const timestamp = summary.timestamp;
  const bmadNote = summary.bmad_analysis ?
    `*Enhanced with BMAD AI agent analysis from ${summary.source}*` :
    `*Generated from project brief analysis*`;

  // Common enhancements for all templates
  let enhanced = content;

  // Add timestamp and BMAD attribution
  enhanced = `${enhanced}

---
**Document Status**: Professional template filled with AI analysis
**Generated**: ${timestamp}
**Source**: ${summary.source}
${bmadNote}

## BMAD Agent Insights

Based on the BMAD multi-agent workflow analysis:

### Project Overview
${summary.overview}

### Target Users
${summary.target_users}

### Key Goals
${summary.goals}

### Constraints & Considerations
${summary.constraints}

---

## Template Instructions

This professional template has been pre-filled with insights from the BMAD agent analysis. Please:

1. Review the BMAD insights above
2. Customize the template sections below for your specific needs
3. Reference the full BMAD analysis in docs/bmad/ for detailed agent outputs
4. Update this document as your project evolves

---
`;

  // File-specific enhancements
  switch (filename) {
    case 'prd.md':
      enhanced += `
## Product Requirements (BMAD-Enhanced)

**Value Proposition**: ${summary.value_prop}

**Success Criteria**: ${summary.acceptance}

**Technical Constraints**: ${summary.tech_stack}
`;
      break;

    case 'architecture.md':
      enhanced += `
## Architecture Overview (BMAD-Enhanced)

**Recommended Architecture**: ${summary.architecture}

**Technology Stack**: ${summary.tech_stack}

**Scalability Considerations**: See BMAD architect agent analysis in docs/bmad/
`;
      break;

    case 'risk-register.md':
      enhanced += `
## Identified Risks (BMAD-Enhanced)

**Technical Risks**: ${summary.risks}

**Mitigation Strategies**: See BMAD QA agent analysis for detailed risk framework
`;
      break;

    case 'user-stories.md':
      enhanced += `
## User Context (BMAD-Enhanced)

**Target Users**: ${summary.target_users}

**User Value**: ${summary.value_prop}

**Success Metrics**: ${summary.acceptance}
`;
      break;

    default:
      enhanced += `
## BMAD Analysis Reference

For detailed insights specific to this document type, reference:
- docs/bmad/analysis-report.md (comprehensive agent analysis)
- docs/bmad/agent-data.json (structured data outputs)
`;
  }

  return enhanced;
}

if (require.main === module) {
  fillTemplates();
}

module.exports = { fillTemplates };