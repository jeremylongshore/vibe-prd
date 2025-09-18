#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const readline = require('readline');

// Enhanced configuration
const QFILE = path.join(__dirname, 'questions.yaml');
const PROJECT_TEMPLATE_DIR = path.join(__dirname, '..', 'professional-templates');
const OUTPUT_BASE_DIR = path.join(__dirname, '..', 'completed-docs');

// Color constants for better UX
const colors = {
  reset: '\x1b[0m',
  bright: '\x1b[1m',
  green: '\x1b[32m',
  blue: '\x1b[34m',
  yellow: '\x1b[33m',
  cyan: '\x1b[36m',
  red: '\x1b[31m'
};

function colorize(text, color) {
  return `${colors[color]}${text}${colors.reset}`;
}

function showProgress(current, total, description) {
  const percent = Math.round((current / total) * 100);
  const bar = '█'.repeat(Math.floor(percent / 5)) + '░'.repeat(20 - Math.floor(percent / 5));
  process.stdout.write(`\r${colorize('Progress:', 'cyan')} [${bar}] ${percent}% - ${description}`);
  if (current === total) {
    console.log(); // New line when complete
  }
}

function parseYAML(str) {
  const lines = str.split(/\r?\n/);
  const out = { sections: [] };
  let cur = null;
  for (let line of lines) {
    if (/^\s*-\s+id:\s*(.+)/.test(line)) {
      cur = { id: RegExp.$1.trim(), title: '', questions: [] };
      out.sections.push(cur);
    } else if (/^\s*title:\s*(.+)/.test(line)) {
      if (cur) cur.title = RegExp.$1.trim();
    } else if (/^\s*-\s+key:\s*(.+)/.test(line)) {
      cur.questions.push({ key: RegExp.$1.trim(), prompt: '', examples: [], required: true });
    } else if (/^\s*prompt:\s*"(.*)"/.test(line)) {
      if (cur && cur.questions.length > 0) {
        cur.questions[cur.questions.length - 1].prompt = RegExp.$1;
      }
    } else if (/^\s*examples:\s*"(.*)"/.test(line)) {
      if (cur && cur.questions.length > 0) {
        cur.questions[cur.questions.length - 1].examples = RegExp.$1.split('|').map(e => e.trim());
      }
    } else if (/^\s*required:\s*(false|true)/.test(line)) {
      if (cur && cur.questions.length > 0) {
        cur.questions[cur.questions.length - 1].required = RegExp.$1 === 'true';
      }
    }
  }
  return out;
}

function validateResponse(response, question) {
  if (question.required && (!response || response.trim().length === 0)) {
    return { valid: false, message: 'This field is required. Please provide a response.' };
  }
  if (response.trim().length > 0 && response.trim().length < 3) {
    return { valid: false, message: 'Response too short. Please provide more detail (minimum 3 characters).' };
  }
  return { valid: true };
}

function render(tpl, data) {
  // Replace {{DATE}} with current date
  const currentDate = new Date().toISOString().split('T')[0];
  let result = tpl.replace(/\{\{DATE\}\}/g, currentDate);

  // Replace other placeholders
  result = result.replace(/{{\s*([\w_]+)\s*}}/g, (_, k) => {
    const value = data[k] || '';
    return typeof value === 'string' ? value.trim() : value;
  });

  return result;
}

function detectProjectTier(answers) {
  // Simple tier detection based on common patterns
  const text = Object.values(answers).join(' ').toLowerCase();

  // Enterprise indicators
  if (text.includes('compliance') || text.includes('audit') || text.includes('enterprise') ||
      text.includes('50+') || text.includes('regulatory') || text.includes('governance')) {
    return 'enterprise';
  }

  // Business indicators
  if (text.includes('team') || text.includes('stakeholder') || text.includes('business') ||
      text.includes('market') || text.includes('revenue') || text.includes('customer')) {
    return 'standard';
  }

  // Default to MVP for startups and simple projects
  return 'mvp';
}

function getTemplatesForTier(tier) {
  const tierTemplates = {
    mvp: ['01_prd.md', '03_generate_tasks.md', '14_project_brief.md', '15_brainstorming.md'],
    standard: [
      '01_prd.md', '02_adr.md', '03_generate_tasks.md', '05_market_research.md',
      '08_personas.md', '09_user_journeys.md', '10_user_stories.md', '11_acceptance_criteria.md',
      '14_project_brief.md', '15_brainstorming.md', '16_frontend_spec.md', '17_test_plan.md'
    ],
    enterprise: [] // Will be populated with all templates
  };

  if (tier === 'enterprise') {
    // Get all templates from professional-templates directory
    try {
      const allTemplates = fs.readdirSync(PROJECT_TEMPLATE_DIR)
        .filter(file => file.endsWith('.md'))
        .sort();
      return allTemplates;
    } catch (err) {
      console.error(colorize('Warning: Could not read professional-templates directory', 'yellow'));
      return tierTemplates.standard; // Fallback to standard
    }
  }

  return tierTemplates[tier] || tierTemplates.mvp;
}

async function generateDocuments(projectName, tier, answers) {
  const templates = getTemplatesForTier(tier);
  const outputDir = path.join(OUTPUT_BASE_DIR, projectName);

  // Create output directory
  fs.mkdirSync(outputDir, { recursive: true });

  console.log(colorize(`\nGenerating ${tier.toUpperCase()} tier documentation...`, 'bright'));

  const generatedDocs = [];

  for (let i = 0; i < templates.length; i++) {
    const templateName = templates[i];
    const templatePath = path.join(PROJECT_TEMPLATE_DIR, templateName);

    showProgress(i, templates.length, `Processing ${templateName}`);

    try {
      if (fs.existsSync(templatePath)) {
        const templateContent = fs.readFileSync(templatePath, 'utf8');
        const renderedContent = render(templateContent, answers);

        const outputPath = path.join(outputDir, templateName);
        fs.writeFileSync(outputPath, renderedContent);
        generatedDocs.push(templateName);
      } else {
        console.log(colorize(`\nWarning: Template ${templateName} not found`, 'yellow'));
      }
    } catch (err) {
      console.log(colorize(`\nError processing ${templateName}: ${err.message}`, 'red'));
    }
  }

  showProgress(templates.length, templates.length, 'Complete!');

  // Generate index file
  const indexContent = generateIndexFile(projectName, tier, generatedDocs, answers);
  fs.writeFileSync(path.join(outputDir, 'index.md'), indexContent);

  return { outputDir, generatedDocs };
}

function generateIndexFile(projectName, tier, generatedDocs, answers) {
  const currentDate = new Date().toISOString().split('T')[0];

  return `# ${projectName} Documentation Suite

**Generated**: ${currentDate}
**Tier**: ${tier.toUpperCase()}
**Templates Used**: ${generatedDocs.length} documents

## Generated Documents

${generatedDocs.map(doc => `- **${doc}** - ${getDocumentDescription(doc)}`).join('\n')}

## Project Summary

Based on your input, this ${tier} tier documentation suite includes the essential documents for your project type and organizational context.

## Key Information Captured

${Object.entries(answers).slice(0, 5).map(([key, value]) =>
  `- **${key.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase())}**: ${value.substring(0, 100)}${value.length > 100 ? '...' : ''}`
).join('\n')}

## Next Steps

1. **Review** each generated document for accuracy and completeness
2. **Customize** sections marked with [CUSTOMIZE] as needed
3. **Share** with your team or stakeholders for feedback
4. **Iterate** by running the form system again as your project evolves

## Need Help?

- Check EXAMPLES.md for similar project references
- Review QUICK_START.md for usage guidance
- Open an issue on GitHub for questions or improvements

---

*Generated with vibe-prd intelligent documentation system*
`;
}

function getDocumentDescription(filename) {
  const descriptions = {
    '01_prd.md': 'Product Requirements Document',
    '02_adr.md': 'Architecture Decision Record',
    '03_generate_tasks.md': 'Implementation Task Breakdown',
    '04_process_task_list.md': 'Task Processing & Management',
    '05_market_research.md': 'Market Research & Analysis',
    '06_architecture.md': 'System Architecture Documentation',
    '07_competitor_analysis.md': 'Competitive Analysis',
    '08_personas.md': 'User Personas & Profiles',
    '09_user_journeys.md': 'User Journey Mapping',
    '10_user_stories.md': 'User Story Templates',
    '11_acceptance_criteria.md': 'Acceptance Criteria Definition',
    '12_qa_gate.md': 'Quality Assurance Gates',
    '13_risk_register.md': 'Risk Management Registry',
    '14_project_brief.md': 'Project Brief & Charter',
    '15_brainstorming.md': 'Brainstorming & Ideation',
    '16_frontend_spec.md': 'Frontend Technical Specification',
    '17_test_plan.md': 'Testing Strategy & Plan',
    '18_release_plan.md': 'Release Planning & Strategy',
    '19_operational_readiness.md': 'Operational Readiness',
    '20_metrics_dashboard.md': 'Metrics & KPI Dashboard',
    '21_postmortem.md': 'Post-Mortem Analysis',
    '22_playtest_usability.md': 'Usability & Playtest Documentation'
  };
  return descriptions[filename] || 'Professional Documentation';
}

(async function main() {
  console.log(colorize('🚀 vibe-prd Enhanced Interactive Documentation Generator', 'bright'));
  console.log(colorize('Transform your project idea into professional documentation\n', 'cyan'));

  // Check for questions file
  if (!fs.existsSync(QFILE)) {
    console.error(colorize('Missing form-system/questions.yaml', 'red'));
    console.log('This tool requires a questions.yaml file to function.');
    process.exit(2);
  }

  // Check for templates directory
  if (!fs.existsSync(PROJECT_TEMPLATE_DIR)) {
    console.error(colorize('Missing professional-templates directory', 'red'));
    console.log('Please ensure the professional-templates directory exists.');
    process.exit(2);
  }

  try {
    const qs = parseYAML(fs.readFileSync(QFILE, 'utf8'));
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
      prompt: colorize('> ', 'green')
    });

    const ask = (question, examples = []) => new Promise(res => {
      let prompt = `\n${colorize(question, 'bright')}`;
      if (examples.length > 0) {
        prompt += `\n${colorize('Examples:', 'blue')} ${examples.join(', ')}`;
      }
      prompt += '\n';
      rl.question(prompt, res);
    });

    const answers = {};
    let totalQuestions = 0;
    let currentQuestion = 0;

    // Count total questions for progress tracking
    for (const sec of qs.sections) {
      totalQuestions += sec.questions.length;
    }

    // Get project name first
    const projectName = await ask('What is your project name?', ['MyApp', 'TeamSync Pro', 'Analytics Dashboard']);
    if (!projectName.trim()) {
      console.log(colorize('Project name is required. Exiting.', 'red'));
      process.exit(1);
    }

    console.log(colorize(`\nGreat! Let's gather information for "${projectName}"`, 'green'));
    console.log(colorize(`This will take about 5-10 minutes to complete.\n`, 'cyan'));

    // Process sections and questions
    for (const sec of qs.sections) {
      console.log(colorize(`\n=== ${sec.title} ===`, 'bright'));

      for (const q of sec.questions) {
        currentQuestion++;

        let response;
        let attempts = 0;
        const maxAttempts = 3;

        do {
          showProgress(currentQuestion - 1, totalQuestions, `${sec.title} (${currentQuestion}/${totalQuestions})`);
          response = await ask(q.prompt, q.examples || []);

          const validation = validateResponse(response, q);
          if (!validation.valid) {
            console.log(colorize(`❌ ${validation.message}`, 'red'));
            attempts++;
            if (attempts >= maxAttempts && !q.required) {
              console.log(colorize('Skipping this question...', 'yellow'));
              response = '[TO BE COMPLETED]';
              break;
            }
          } else {
            break;
          }
        } while (attempts < maxAttempts);

        answers[q.key] = response.trim();
      }
    }

    rl.close();

    // Detect appropriate tier
    const detectedTier = detectProjectTier(answers);
    console.log(colorize(`\nDetected documentation tier: ${detectedTier.toUpperCase()}`, 'bright'));

    // Generate documents
    const result = await generateDocuments(projectName, detectedTier, answers);

    // Success message
    console.log(colorize('\n🎉 Documentation Generation Complete!', 'green'));
    console.log(colorize(`📁 Location: ${result.outputDir}`, 'cyan'));
    console.log(colorize(`📋 Generated: ${result.generatedDocs.length} professional documents`, 'cyan'));
    console.log(colorize(`🎯 Tier: ${detectedTier.toUpperCase()}`, 'cyan'));

    console.log(colorize('\n📖 Next Steps:', 'bright'));
    console.log('1. Review generated documents in your project folder');
    console.log('2. Customize [CUSTOMIZE] sections as needed');
    console.log('3. Share with team/stakeholders for feedback');
    console.log('4. Regenerate anytime as project evolves');

    console.log(colorize('\n✨ Happy documenting!', 'green'));

  } catch (error) {
    console.error(colorize(`\n❌ Error: ${error.message}`, 'red'));
    process.exit(1);
  }
})();