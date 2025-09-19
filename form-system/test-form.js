#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

// Test the form system with mock data
const QFILE = path.join(__dirname, 'questions.yaml');
const TPLFILE = path.join(__dirname, 'CLAUDE.template.md');
const OUTFILE = path.join(__dirname, '..', 'completed-docs', 'form-test-output.md');

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
      cur.questions.push({ key: RegExp.$1.trim(), prompt: '' });
    } else if (/^\s*prompt:\s*"(.*)"/.test(line)) {
      cur.questions[cur.questions.length - 1].prompt = RegExp.$1;
    }
  }
  return out;
}

function render(tpl, data) {
  return tpl.replace(/{{\s*([\w_]+)\s*}}/g, (_, k) => (data[k] || '[NOT PROVIDED]').trim());
}

// Mock answers for testing
const mockAnswers = {
  project_name: 'test-form-system',
  project_type: 'greenfield',
  overview: 'Testing the enhanced form system with 30+ structured questions to validate end-to-end functionality.',
  value_prop: 'Validates form system works correctly with comprehensive question set.',
  problem_statement: 'Need to ensure form system generates proper output from template.',
  target_users: 'Developers testing the vibe-prd form system',
  user_pains: 'Uncertain if form changes work, complex manual testing, no automation',
  user_personas: 'Tester: wants quick validation; Developer: needs working tools',
  user_journey: 'Run test, check output, verify placeholders replaced',
  user_success: 'Form generates complete document without errors',
  tech_stack: 'Node.js, JavaScript, YAML, Handlebars-style templates',
  integrations: 'None for this test',
  data_requirements: 'Question/answer pairs, template placeholders',
  scalability: 'Single user test scenario',
  security_requirements: 'No security requirements for local testing',
  business_goals: '1. Validate form functionality 2. Test template rendering 3. Confirm 30+ questions work',
  success_metrics: 'Generated document contains all sections, no placeholder errors',
  competitive_landscape: 'N/A for testing',
  market_size: 'Internal testing only',
  revenue_model: 'No revenue model for test',
  timeline: 'Immediate validation needed',
  budget: 'Zero budget test',
  team_size: '1 developer',
  dependencies: 'Working Node.js environment',
  compliance: 'No compliance requirements',
  technical_risks: 'Template parsing errors, missing placeholders, YAML parsing issues',
  business_risks: 'Form system doesn\'t work as expected',
  assumptions: 'Node.js works, files are readable, template syntax is correct',
  fallback_plans: 'Manual testing if automated test fails',
  acceptance_criteria: 'Form generates complete document with all sections populated',
  user_acceptance: 'Manual review of generated output',
  performance_criteria: 'Completes in under 5 seconds',
  rollback_criteria: 'If any critical errors in output'
};

try {
  // Check if files exist
  if (!fs.existsSync(QFILE)) {
    console.error('❌ Missing questions.yaml');
    process.exit(1);
  }
  if (!fs.existsSync(TPLFILE)) {
    console.error('❌ Missing CLAUDE.template.md');
    process.exit(1);
  }

  // Parse questions
  const qs = parseYAML(fs.readFileSync(QFILE, 'utf8'));
  console.log(`✅ Parsed ${qs.sections.length} sections`);

  // Count total questions
  const totalQuestions = qs.sections.reduce((sum, sec) => sum + sec.questions.length, 0);
  console.log(`✅ Found ${totalQuestions} total questions`);

  // Validate all questions have keys
  let validQuestions = 0;
  for (const sec of qs.sections) {
    for (const q of sec.questions) {
      if (q.key && q.prompt) validQuestions++;
    }
  }
  console.log(`✅ ${validQuestions} questions have both key and prompt`);

  // Load and render template
  const tpl = fs.readFileSync(TPLFILE, 'utf8');
  const out = render(tpl, mockAnswers);

  // Ensure output directory exists
  fs.mkdirSync(path.dirname(OUTFILE), { recursive: true });
  fs.writeFileSync(OUTFILE, out);

  console.log(`✅ Generated output: ${OUTFILE}`);

  // Check for unreplaced placeholders
  const unreplacedMatches = out.match(/{{\s*[\w_]+\s*}}/g);
  if (unreplacedMatches) {
    console.log(`⚠️  Found ${unreplacedMatches.length} unreplaced placeholders:`);
    console.log(unreplacedMatches.join(', '));
  } else {
    console.log('✅ All placeholders successfully replaced');
  }

  console.log('\n📋 Form System Test: PASSED');

} catch (error) {
  console.error('❌ Form System Test: FAILED');
  console.error(error.message);
  process.exit(1);
}