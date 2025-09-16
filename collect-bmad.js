#!/usr/bin/env node
const fs=require('fs'),path=require('path');
const ROOT=process.cwd(), DOCS=path.join(ROOT,'docs'), BMAD=path.join(DOCS,'bmad');
fs.mkdirSync(BMAD,{recursive:true});
if(!fs.existsSync(DOCS))process.exit(0);
for(const f of fs.readdirSync(DOCS)){
  if(['bmad','templates'].includes(f)) continue;
  const src=path.join(DOCS,f), dst=path.join(BMAD,f);
  try{ if(fs.lstatSync(src).isFile()){ fs.renameSync(src,dst); } }catch{}
}
console.log('BMAD natives normalized into docs/bmad/');