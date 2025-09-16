#!/usr/bin/env node
const fs=require('fs'),path=require('path'),readline=require('readline');
const Q=path.join(__dirname,'questions.yaml');
const T=path.join(process.cwd(),'vibe-prd','CLAUDE.template.md');
const O=path.join(process.cwd(),'vibe-prd','CLAUDE.md');

function parseYAML(s){const L=s.split(/\r?\n/);const out={sections:[]};let cur=null;
  for(const line of L){
    if(/^\s*-\s+id:\s*(.+)/.test(line)){cur={id:RegExp.$1.trim(),title:'',questions:[]};out.sections.push(cur);}
    else if(/^\s*title:\s*(.+)/.test(line)){if(cur)cur.title=RegExp.$1.trim();}
    else if(/^\s*-\s+key:\s*(.+)/.test(line)){cur.questions.push({key:RegExp.$1.trim(),prompt:''});}
    else if(/^\s*prompt:\s*"(.*)"/.test(line)){cur.questions[cur.questions.length-1].prompt=RegExp.$1;}
  } return out;
}
function render(tpl,data){return tpl.replace(/{{\s*([\w_]+)\s*}}/g,(_,k)=> (data[k]||'').trim());}
(async function(){
  if(!fs.existsSync(Q)||!fs.existsSync(T)){console.error('Missing questions.yaml or vibe-prd/CLAUDE.template.md');process.exit(2);}
  const qs=parseYAML(fs.readFileSync(Q,'utf8'));
  const rl=readline.createInterface({input:process.stdin,output:process.stdout});
  const ask=q=>new Promise(r=>rl.question(`\n${q}\n> `,a=>r(a)));
  const A={}; for(const s of qs.sections){console.log(`\n=== ${s.title} ===`);for(const q of s.questions){A[q.key]=await ask(q.prompt);}}
  rl.close(); const tpl=fs.readFileSync(T,'utf8'); const out=render(tpl,A);
  fs.mkdirSync(path.dirname(O),{recursive:true}); fs.writeFileSync(O,out); console.log(`Wrote ${O}`);
})();