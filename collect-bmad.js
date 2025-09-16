#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

const ROOT = process.cwd();
const DOCS = path.join(ROOT, 'docs');
const BMAD = path.join(DOCS, 'bmad');

// Ensure docs/bmad directory exists
fs.mkdirSync(BMAD, { recursive: true });

// BMAD collect is a simple passthrough - the container already writes to docs/bmad/
// This script exists for workflow consistency but doesn't need to do additional collection
console.log('🔄 BMAD collection: docs/bmad/ ready for processing');

// Verify BMAD outputs exist
if (fs.existsSync(BMAD) && fs.readdirSync(BMAD).length > 0) {
  console.log('✅ BMAD native files collected in docs/bmad/');
} else {
  console.log('⚠️  BMAD outputs not found, proceeding with fallback');
}