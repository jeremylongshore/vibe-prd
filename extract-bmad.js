#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const BMAD_DIR = 'docs/bmad';
const OUTPUT_FILE = 'docs/bmad/summary.json';

function extractBmadData() {
  console.log('🔍 Extracting BMAD agent outputs...');

  try {
    // Read BMAD agent data
    const agentDataPath = path.join(BMAD_DIR, 'agent-data.json');
    if (!fs.existsSync(agentDataPath)) {
      throw new Error(`BMAD agent data not found: ${agentDataPath}`);
    }

    const bmadData = JSON.parse(fs.readFileSync(agentDataPath, 'utf8'));

    // Extract structured data for template filling
    const summary = {
      timestamp: bmadData.timestamp,
      source: bmadData.source,

      // Project overview from BMAD analysis
      overview: bmadData.agent_outputs.pm.value_proposition,
      target_users: bmadData.agent_outputs.analyst.target_users,
      value_prop: bmadData.agent_outputs.pm.value_proposition,

      // Goals and constraints
      goals: bmadData.agent_outputs.pm.goals,
      constraints: bmadData.agent_outputs.pm.constraints,
      compliance: "See BMAD agent analysis for compliance requirements",

      // Risks and assumptions
      risks: bmadData.agent_outputs.dev.technical_risks.join(', '),
      assumptions: "Market demand validation, technical feasibility, resource availability",

      // Acceptance criteria
      acceptance: bmadData.agent_outputs.pm.success_criteria,

      // Technical details
      tech_stack: bmadData.agent_outputs.architect.tech_stack,
      architecture: bmadData.agent_outputs.architect.architecture_type,

      // Full BMAD context for detailed documents
      bmad_analysis: bmadData.agent_outputs
    };

    // Ensure output directory exists
    fs.mkdirSync(path.dirname(OUTPUT_FILE), { recursive: true });

    // Write summary for template filling
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(summary, null, 2));

    console.log('✅ BMAD data extracted to summary.json');
    console.log(`📄 Found: ${Object.keys(summary).length} data fields for template filling`);

    return summary;

  } catch (error) {
    console.error('❌ BMAD extraction failed:', error.message);

    // Fallback: create empty summary for template filling
    const fallbackSummary = {
      timestamp: new Date().toISOString(),
      source: 'fallback',
      overview: "Project overview not available from BMAD",
      target_users: "Target users not specified",
      value_prop: "Value proposition pending BMAD analysis",
      goals: "Project goals to be defined",
      constraints: "Constraints to be identified",
      compliance: "Compliance requirements to be assessed",
      risks: "Risk analysis pending",
      assumptions: "Assumptions to be validated",
      acceptance: "Success criteria to be defined",
      tech_stack: "Technology stack to be selected",
      architecture: "Architecture to be designed",
      bmad_analysis: null
    };

    fs.mkdirSync(path.dirname(OUTPUT_FILE), { recursive: true });
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(fallbackSummary, null, 2));

    console.log('📋 Created fallback summary for template filling');
    return fallbackSummary;
  }
}

if (require.main === module) {
  extractBmadData();
}

module.exports = { extractBmadData };