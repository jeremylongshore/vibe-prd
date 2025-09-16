#!/usr/bin/env node
const fs=require('fs'),path=require('path');
const MAP=path.join(process.cwd(),'map.yaml');
const SUM=path.join(process.cwd(),'docs','bmad','summary.json');
const OUTDIR=path.join(process.cwd(),'docs','templates');

function listTemplates(){return fs.readFileSync(MAP,'utf8').split(/\r?\n/).filter(l=>/^\s*-\s+/.test(l)).map(l=>l.replace(/^\s*-\s+/,'').trim());}
function render(tpl,data){return tpl.replace(/{{\s*([\w.]+)\s*}}/g,(_,k)=>k.split('.').reduce((v,p)=>v&&v[p],data)||'');}

const files=listTemplates(); const data=fs.existsSync(SUM)?JSON.parse(fs.readFileSync(SUM,'utf8')):{};
fs.mkdirSync(OUTDIR,{recursive:true});
for(const name of files){
  const tplPath=path.join(process.cwd(),'templates',name);
  const outPath=path.join(OUTDIR,name);
  const tpl=fs.existsSync(tplPath)?fs.readFileSync(tplPath,'utf8'):
`# ${name}\n\nOverview:\n{{project.overview}}\n\nGoals:\n{{project.goals}}\n`;
  fs.writeFileSync(outPath,render(tpl,data));
}
console.log(`Filled ${files.length} templates into ${OUTDIR}`);