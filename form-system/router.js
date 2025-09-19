/**
 * Intelligent Project Classification and Routing System
 * Analyzes user responses to automatically determine optimal documentation approach
 */

class ProjectRouter {

    /**
     * Analyze user input and classify project type, complexity, and industry
     * @param {string} userResponse - User's description of their project
     * @returns {Object} Classification result with confidence scores
     */
    classify(userResponse) {
        const response = userResponse.toLowerCase();

        // Analyze project type (Greenfield vs Brownfield)
        const projectType = this._analyzeProjectType(response);

        // Analyze complexity level (MVP vs Standard vs Enterprise)
        const complexity = this._analyzeComplexity(response);

        // Detect industry-specific indicators
        const industry = this._detectIndustry(response);

        // Calculate overall confidence in classification
        const confidence = this._calculateConfidence(response, projectType, complexity);

        return {
            projectType: projectType.type,
            complexity: complexity.type,
            industry: industry.type,
            confidence: confidence,
            reasoning: {
                projectType: projectType.indicators,
                complexity: complexity.indicators,
                industry: industry.indicators
            }
        };
    }

    /**
     * Get appropriate templates for a given classification
     * @param {Object} classification - Result from classify()
     * @returns {Array} List of template filenames to generate
     */
    templatesFor(classification) {
        const { complexity } = classification;

        const mvpTemplates = [
            '01_prd.md',
            '03_generate_tasks.md',
            '14_project_brief.md',
            '15_brainstorming.md'
        ];

        const standardTemplates = [
            ...mvpTemplates,
            '02_adr.md',
            '05_market_research.md',
            '08_personas.md',
            '09_user_journeys.md',
            '10_user_stories.md',
            '11_acceptance_criteria.md',
            '16_frontend_spec.md',
            '17_test_plan.md'
        ];

        const enterpriseTemplates = [
            '01_prd.md',
            '02_adr.md',
            '03_generate_tasks.md',
            '04_process_task_list.md',
            '05_market_research.md',
            '06_architecture.md',
            '07_competitor_analysis.md',
            '08_personas.md',
            '09_user_journeys.md',
            '10_user_stories.md',
            '11_acceptance_criteria.md',
            '12_qa_gate.md',
            '13_risk_register.md',
            '14_project_brief.md',
            '15_brainstorming.md',
            '16_frontend_spec.md',
            '17_test_plan.md',
            '18_release_plan.md',
            '19_operational_readiness.md',
            '20_metrics_dashboard.md',
            '21_postmortem.md',
            '22_playtest_usability.md'
        ];

        switch (complexity) {
            case 'mvp':
                return mvpTemplates;
            case 'standard':
                return standardTemplates;
            case 'enterprise':
                return enterpriseTemplates;
            default:
                return mvpTemplates; // Safe fallback
        }
    }

    /**
     * Analyze whether project is Greenfield (new) or Brownfield (existing)
     * @private
     */
    _analyzeProjectType(response) {
        const greenfieldIndicators = [
            'new app', 'new idea', 'new product', 'new startup', 'startup',
            'building from scratch', 'creating a', 'launching a business',
            'want to build', 'planning to create', 'starting a',
            'i have an idea', 'building an app', 'making a'
        ];

        const brownfieldIndicators = [
            'existing system', 'existing platform', 'existing product',
            'adding', 'integrating with', 'extending', 'enhancing',
            'current platform', 'legacy system', 'our system',
            'we have', 'our current', 'improve our', 'upgrade our'
        ];

        const greenfieldScore = this._scoreIndicators(response, greenfieldIndicators);
        const brownfieldScore = this._scoreIndicators(response, brownfieldIndicators);

        if (greenfieldScore > brownfieldScore) {
            return {
                type: 'greenfield',
                indicators: greenfieldIndicators.filter(indicator => response.includes(indicator))
            };
        } else if (brownfieldScore > greenfieldScore) {
            return {
                type: 'brownfield',
                indicators: brownfieldIndicators.filter(indicator => response.includes(indicator))
            };
        } else {
            // Default to greenfield if unclear
            return {
                type: 'greenfield',
                indicators: ['unclear - defaulted to greenfield']
            };
        }
    }

    /**
     * Analyze project complexity level
     * @private
     */
    _analyzeComplexity(response) {
        const mvpIndicators = [
            'mvp', 'simple', 'basic', 'quick', 'validate', 'prototype',
            'i want', 'my idea', 'personal project', 'solo',
            'startup idea', 'side project', 'freelance'
        ];

        const standardIndicators = [
            'business team', 'we need', 'our team', 'company',
            'stakeholders', 'feature', 'integration', 'users',
            'professional', 'business', 'commercial'
        ];

        const enterpriseIndicators = [
            'enterprise', 'compliance', 'regulation', 'audit', 'governance',
            'hipaa', 'sox', 'gdpr', 'security requirements',
            'board approval', 'procurement', '500+ users',
            'disaster recovery', 'enterprise customers', 'b2b'
        ];

        const mvpScore = this._scoreIndicators(response, mvpIndicators);
        const standardScore = this._scoreIndicators(response, standardIndicators);
        const enterpriseScore = this._scoreIndicators(response, enterpriseIndicators);

        if (enterpriseScore > 0) {
            return {
                type: 'enterprise',
                indicators: enterpriseIndicators.filter(indicator => response.includes(indicator))
            };
        } else if (standardScore > mvpScore) {
            return {
                type: 'standard',
                indicators: standardIndicators.filter(indicator => response.includes(indicator))
            };
        } else {
            return {
                type: 'mvp',
                indicators: mvpIndicators.filter(indicator => response.includes(indicator))
            };
        }
    }

    /**
     * Detect industry-specific context
     * @private
     */
    _detectIndustry(response) {
        const industries = {
            fintech: ['finance', 'banking', 'payment', 'crypto', 'trading', 'investment'],
            healthtech: ['health', 'medical', 'patient', 'doctor', 'clinical', 'hipaa'],
            mobile: ['mobile', 'ios', 'android', 'app store', 'smartphone'],
            ai: ['ai', 'machine learning', 'ml', 'neural', 'algorithm', 'model'],
            ecommerce: ['ecommerce', 'shopping', 'cart', 'payment', 'store', 'retail']
        };

        for (const [industry, keywords] of Object.entries(industries)) {
            const score = this._scoreIndicators(response, keywords);
            if (score > 0) {
                return {
                    type: industry,
                    indicators: keywords.filter(keyword => response.includes(keyword))
                };
            }
        }

        return {
            type: 'general',
            indicators: []
        };
    }

    /**
     * Calculate confidence score for classification
     * @private
     */
    _calculateConfidence(response, projectType, complexity) {
        const responseLength = response.split(' ').length;

        // Base confidence on response length and indicator strength
        let confidence = Math.min(responseLength / 20, 1.0); // Max confidence at 20+ words

        // Boost confidence if we found strong indicators
        if (projectType.indicators.length > 0) confidence += 0.2;
        if (complexity.indicators.length > 0) confidence += 0.2;

        // Penalize if response is too short
        if (responseLength < 5) confidence *= 0.5;

        return Math.min(confidence, 1.0);
    }

    /**
     * Score how many indicators are found in response
     * @private
     */
    _scoreIndicators(response, indicators) {
        return indicators.reduce((score, indicator) => {
            return response.includes(indicator) ? score + 1 : score;
        }, 0);
    }

    /**
     * Generate follow-up questions when classification confidence is low
     * @param {Object} classification - Classification result
     * @returns {Array} Array of clarifying questions
     */
    generateFollowUpQuestions(classification) {
        const questions = [];

        if (classification.confidence < 0.7) {
            questions.push("That sounds interesting! To give you the best documentation, could you tell me:");

            if (classification.projectType === 'greenfield' && classification.confidence < 0.6) {
                questions.push("- Are you starting something completely new, or building on an existing system?");
            }

            if (classification.complexity === 'mvp' && classification.confidence < 0.6) {
                questions.push("- Is this a personal project, business team feature, or enterprise project?");
            }

            questions.push("- What problem are you solving and for whom?");
            questions.push("- Any specific technical requirements or constraints?");
        }

        return questions;
    }
}

module.exports = new ProjectRouter();