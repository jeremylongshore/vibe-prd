#!/usr/bin/env node

/**
 * Test script for /new-project command functionality
 * Validates that all components work together correctly
 */

import { promises as fs } from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.join(__dirname, '..');

console.log('🧪 Testing /new-project command components...\n');

async function testTemplateLibrary() {
    console.log('📋 Testing professional template library...');

    const templatesDir = path.join(rootDir, 'professional-templates');
    const expectedTemplates = [
        '01_prd.md', '02_adr.md', '03_generate_tasks.md', '04_process_task_list.md',
        '05_market_research.md', '06_architecture.md', '07_competitor_analysis.md',
        '08_personas.md', '09_user_journeys.md', '10_user_stories.md',
        '11_acceptance_criteria.md', '12_qa_gate.md', '13_risk_register.md',
        '14_project_brief.md', '15_brainstorming.md', '16_frontend_spec.md',
        '17_test_plan.md', '18_release_plan.md', '19_operational_readiness.md',
        '20_metrics_dashboard.md', '21_postmortem.md', '22_playtest_usability.md'
    ];

    try {
        const files = await fs.readdir(templatesDir);
        const templateFiles = files.filter(f => f.endsWith('.md'));

        if (templateFiles.length !== 22) {
            throw new Error(`Expected 22 templates, found ${templateFiles.length}`);
        }

        for (const template of expectedTemplates) {
            if (!templateFiles.includes(template)) {
                throw new Error(`Missing template: ${template}`);
            }
        }

        // Test template content for {{DATE}} placeholders
        const sampleTemplate = await fs.readFile(path.join(templatesDir, '01_prd.md'), 'utf8');
        if (!sampleTemplate.includes('{{DATE}}')) {
            throw new Error('Templates missing {{DATE}} placeholders');
        }

        console.log('✅ Template library: 22 templates found with proper formatting\n');
    } catch (error) {
        console.error('❌ Template library test failed:', error.message);
        process.exit(1);
    }
}

async function testRouter() {
    console.log('🤖 Testing intelligent project router...');

    try {
        // Import router (using require since it's CommonJS)
        const { createRequire } = await import('module');
        const require = createRequire(import.meta.url);
        const router = require('../form-system/router.js');

        // Test classification
        const testCases = [
            {
                input: "I want to build a fitness tracking app for runners",
                expected: { projectType: 'greenfield', complexity: 'mvp' }
            },
            {
                input: "We need to add authentication to our existing platform",
                expected: { projectType: 'brownfield', complexity: 'standard' }
            },
            {
                input: "Enterprise healthcare platform with HIPAA compliance requirements",
                expected: { projectType: 'greenfield', complexity: 'enterprise', industry: 'healthtech' }
            }
        ];

        for (const testCase of testCases) {
            const result = router.classify(testCase.input);

            if (result.projectType !== testCase.expected.projectType) {
                throw new Error(`Project type mismatch for "${testCase.input}": expected ${testCase.expected.projectType}, got ${result.projectType}`);
            }

            if (result.complexity !== testCase.expected.complexity) {
                throw new Error(`Complexity mismatch for "${testCase.input}": expected ${testCase.expected.complexity}, got ${result.complexity}`);
            }

            if (testCase.expected.industry && result.industry !== testCase.expected.industry) {
                throw new Error(`Industry mismatch for "${testCase.input}": expected ${testCase.expected.industry}, got ${result.industry}`);
            }
        }

        // Test template selection
        const mvpTemplates = router.templatesFor({ complexity: 'mvp' });
        const standardTemplates = router.templatesFor({ complexity: 'standard' });
        const enterpriseTemplates = router.templatesFor({ complexity: 'enterprise' });

        if (mvpTemplates.length !== 4) {
            throw new Error(`MVP should return 4 templates, got ${mvpTemplates.length}`);
        }

        if (standardTemplates.length !== 12) {
            throw new Error(`Standard should return 12 templates, got ${standardTemplates.length}`);
        }

        if (enterpriseTemplates.length !== 22) {
            throw new Error(`Enterprise should return 22 templates, got ${enterpriseTemplates.length}`);
        }

        console.log('✅ Router: Classification and template selection working correctly\n');
    } catch (error) {
        console.error('❌ Router test failed:', error.message);
        process.exit(1);
    }
}

async function testIndexGenerator() {
    console.log('📊 Testing index generator...');

    try {
        const { createRequire } = await import('module');
        const require = createRequire(import.meta.url);
        const generateIndex = require('../scripts/generate-index.js');

        // Test data
        const mockClassification = {
            projectType: 'greenfield',
            complexity: 'mvp',
            industry: 'general',
            confidence: 0.9,
            reasoning: {
                projectType: ['new app', 'want to build'],
                complexity: ['mvp', 'startup'],
                industry: []
            }
        };

        const mockTemplates = ['01_prd.md', '03_generate_tasks.md', '14_project_brief.md', '15_brainstorming.md'];
        const testProjectName = 'test-project-validation';
        const testOutputDir = path.join(rootDir, 'completed-docs');

        // Generate test project
        await generateIndex(testProjectName, mockClassification, mockTemplates, {}, testOutputDir);

        // Verify files were created
        const projectDir = path.join(testOutputDir, testProjectName);
        const indexPath = path.join(projectDir, 'index.md');
        const metadataDir = path.join(projectDir, '.metadata');

        const indexExists = await fs.access(indexPath).then(() => true).catch(() => false);
        if (!indexExists) {
            throw new Error('index.md not generated');
        }

        const metadataExists = await fs.access(metadataDir).then(() => true).catch(() => false);
        if (!metadataExists) {
            throw new Error('.metadata directory not created');
        }

        // Verify index content
        const indexContent = await fs.readFile(indexPath, 'utf8');
        const expectedProjectTitle = testProjectName.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
        if (!indexContent.includes(expectedProjectTitle)) {
            throw new Error(`Index missing project name - expected "${expectedProjectTitle}" in content`);
        }

        if (!indexContent.includes('MVP')) {
            throw new Error('Index missing tier information');
        }

        // Clean up test files
        await fs.rm(projectDir, { recursive: true, force: true });

        console.log('✅ Index generator: Project organization working correctly\n');
    } catch (error) {
        console.error('❌ Index generator test failed:', error.message);
        process.exit(1);
    }
}

async function testCommandFile() {
    console.log('📝 Testing command file...');

    try {
        const commandPath = path.join(rootDir, 'docs/claude_commands/new-project.md');
        const commandExists = await fs.access(commandPath).then(() => true).catch(() => false);

        if (!commandExists) {
            throw new Error('Command file not found at docs/claude_commands/new-project.md');
        }

        const commandContent = await fs.readFile(commandPath, 'utf8');

        // Check for required sections
        const requiredSections = [
            'Natural Project Discovery',
            'Intelligent Response Analysis',
            'Intelligent Routing & Confirmation',
            'Template Selection & Generation',
            'Document Generation',
            'Project Organization'
        ];

        for (const section of requiredSections) {
            if (!commandContent.includes(section)) {
                throw new Error(`Command missing required section: ${section}`);
            }
        }

        // Check for router integration
        if (!commandContent.includes('router.classify') || !commandContent.includes('router.templatesFor')) {
            throw new Error('Command missing router integration');
        }

        console.log('✅ Command file: Complete specification with all required sections\n');
    } catch (error) {
        console.error('❌ Command file test failed:', error.message);
        process.exit(1);
    }
}

async function testOnePageSetup() {
    console.log('🚀 Testing one-paste setup file...');

    try {
        const setupPath = path.join(rootDir, 'CLAUDE_ONE_PASTE.md');
        const setupExists = await fs.access(setupPath).then(() => true).catch(() => false);

        if (!setupExists) {
            throw new Error('CLAUDE_ONE_PASTE.md not found');
        }

        const setupContent = await fs.readFile(setupPath, 'utf8');

        // Check for required elements
        if (!setupContent.includes('git clone')) {
            throw new Error('Setup missing git clone instructions');
        }

        if (!setupContent.includes('~/.claude/commands/')) {
            throw new Error('Setup missing command installation path');
        }

        if (!setupContent.includes('/new-project')) {
            throw new Error('Setup missing command usage');
        }

        console.log('✅ One-paste setup: Complete user instructions\n');
    } catch (error) {
        console.error('❌ One-paste setup test failed:', error.message);
        process.exit(1);
    }
}

async function runAllTests() {
    console.log('🎯 vibe-prd /new-project Command Test Suite\n');

    await testTemplateLibrary();
    await testRouter();
    await testIndexGenerator();
    await testCommandFile();
    await testOnePageSetup();

    console.log('🎉 All tests passed! /new-project command is ready for production.\n');
    console.log('📋 Installation Instructions:');
    console.log('1. Copy docs/claude_commands/new-project.md to ~/.claude/commands/');
    console.log('2. Type /new-project in any Claude Code CLI session');
    console.log('3. Enjoy intelligent AI documentation generation!\n');

    console.log('🚀 One-Paste User Experience:');
    console.log('Users can paste the commands from CLAUDE_ONE_PASTE.md into Claude Code');
    console.log('to automatically install and start using /new-project\n');
}

// Run tests
runAllTests().catch(error => {
    console.error('💥 Test suite failed:', error.message);
    process.exit(1);
});