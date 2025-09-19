#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const readline = require('readline');

const QFILE = path.join(__dirname, 'questions.yaml');
const TPLFILE = path.join(__dirname, 'CLAUDE.template.md');
const OUTFILE = path.join(__dirname, '..', 'completed-docs', 'form-generated-project.md');

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
  return tpl.replace(/{{\s*([\w_]+)\s*}}/g, (_, k) => (data[k] || '').trim());
}

(async function main() {
  if (!fs.existsSync(QFILE) || !fs.existsSync(TPLFILE)) {
    console.error('Missing form-system/questions.yaml or vibe-prd/CLAUDE.template.md');
    process.exit(2);
  }
  const qs = parseYAML(fs.readFileSync(QFILE, 'utf8'));
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  const ask = q => new Promise(res => rl.question(`\n${q}\n> `, a => res(a)));
  const answers = {};
  for (const sec of qs.sections) {
    console.log(`\n=== ${sec.title} ===`);
    for (const q of sec.questions) {
      answers[q.key] = await ask(q.prompt);
    }
  }
  rl.close();
  const tpl = fs.readFileSync(TPLFILE, 'utf8');
  const out = render(tpl, answers);
  fs.mkdirSync(path.dirname(OUTFILE), { recursive: true });
  fs.writeFileSync(OUTFILE, out);
  console.log(`\nWrote ${OUTFILE}`);
})();