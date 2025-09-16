#!/usr/bin/env node
const fs=require('fs'),path=require('path');
const BMAD=path.join(process.cwd(),'docs','bmad'), OUT=path.join(BMAD,'summary.json');
function mergeJSON(d){const acc={}; if(!fs.existsSync(d))return acc;
  for(const f of fs.readdirSync(d).filter(x=>x.endsWith('.json'))){
    try{Object.assign(acc,JSON.parse(fs.readFileSync(path.join(d,f),'utf8')));}catch{}
  } return acc;
}
function mdHead(txt,h){const m=txt.split(new RegExp(`^##\\s+${h}\\s*$`,'mi')); if(m.length<2)return''; return m[1].split(/^##\s+/m)[0].trim();}
function fallbackFromBrief(){
  const f=path.join(process.cwd(),'vibe-prd','CLAUDE.md'); if(!fs.existsSync(f))return {};
  const t=fs.readFileSync(f,'utf8');
  return { project:{
    overview: mdHead(t,'Overview'),
    target_users: mdHead(t,'Target Users'),
    value_prop: mdHead(t,'Value Proposition'),
    goals: mdHead(t,'Goals').split(/\n/).filter(Boolean),
    constraints: mdHead(t,'Constraints'),
    compliance: mdHead(t,'Compliance'),
    risks: mdHead(t,'Risks & Mitigations').split(/\n/).filter(Boolean),
    assumptions: mdHead(t,'Assumptions').split(/\n/).filter(Boolean),
    acceptance: mdHead(t,'Acceptance Criteria')
  }};
}
let obj=mergeJSON(BMAD); if(!obj.project) obj=fallbackFromBrief();
fs.writeFileSync(OUT,JSON.stringify(obj,null,2)); console.log(`Wrote ${OUT}`);