#!/bin/bash
# Interactive CLI interface for vibe-prd templates

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TASKS_DIR="$PROJECT_ROOT/tasks"
TEMPLATES_DIR="$PROJECT_ROOT/professional-templates"

# Create tasks directory
mkdir -p "$TASKS_DIR"

# Banner
clear
echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║     ${GREEN}vibe-prd Interactive CLI${CYAN}          ║${NC}"
echo -e "${CYAN}║     ${YELLOW}Professional Documentation${CYAN}        ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════╝${NC}"
echo ""

# Main menu
show_menu() {
    echo -e "${BLUE}Select Template Category:${NC}"
    echo ""
    echo -e "${GREEN}Planning Phase${NC}"
    echo "  1) PRD - Product Requirements Document"
    echo "  2) BRD - Business Requirements Document"
    echo "  3) RFC - Request for Comments"
    echo "  4) Tech Spec - Technical Specification"
    echo ""
    echo -e "${MAGENTA}Design Phase${NC}"
    echo "  5) Design Doc - System Design"
    echo "  6) API Spec - API Specification"
    echo "  7) Database Schema"
    echo "  8) User Stories"
    echo ""
    echo -e "${YELLOW}Operations Phase${NC}"
    echo "  9) Runbook - Operational Guide"
    echo " 10) Post-Mortem - Incident Analysis"
    echo " 11) SOP - Standard Operating Procedure"
    echo ""
    echo -e "${CYAN}Project Management${NC}"
    echo " 12) Project Charter"
    echo " 13) RACI Matrix"
    echo " 14) Risk Register"
    echo ""
    echo -e "${RED}Utilities${NC}"
    echo " 15) Generate Tasks from PRD"
    echo " 16) Process Task List"
    echo " 17) View Recent Documents"
    echo ""
    echo "  0) Exit"
    echo ""
}

# Process template
process_template() {
    local template_file="$1"
    local output_prefix="$2"
    local template_name="$3"

    echo -e "${GREEN}═══════════════════════════════════════${NC}"
    echo -e "${YELLOW}Creating ${template_name}${NC}"
    echo -e "${GREEN}═══════════════════════════════════════${NC}"
    echo ""

    # Get feature/project name
    echo -e "${BLUE}Enter project/feature name: ${NC}"
    read -r PROJECT_NAME

    # Generate filename
    SAFE_NAME=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g')
    TIMESTAMP=$(date +%Y%m%d-%H%M%S)
    OUTPUT_FILE="$TASKS_DIR/${output_prefix}-${SAFE_NAME}-${TIMESTAMP}.md"

    # Show template
    echo ""
    echo -e "${YELLOW}Template loaded. Options:${NC}"
    echo "1) Copy to clipboard (if xclip/pbcopy available)"
    echo "2) Display for manual copy"
    echo "3) Save template to file"
    echo "4) Open in editor"
    echo ""
    echo -e "${BLUE}Choose option [1-4]: ${NC}"
    read -r OPTION

    case $OPTION in
        1)
            if command -v xclip &> /dev/null; then
                cat "$template_file" | sed "s/{{PROJECT}}/${PROJECT_NAME}/g" | xclip -selection clipboard
                echo -e "${GREEN}✅ Copied to clipboard!${NC}"
            elif command -v pbcopy &> /dev/null; then
                cat "$template_file" | sed "s/{{PROJECT}}/${PROJECT_NAME}/g" | pbcopy
                echo -e "${GREEN}✅ Copied to clipboard!${NC}"
            else
                echo -e "${RED}Clipboard tool not found. Displaying instead:${NC}"
                cat "$template_file" | sed "s/{{PROJECT}}/${PROJECT_NAME}/g"
            fi
            ;;
        2)
            echo -e "${YELLOW}═══════════════════════════════════════${NC}"
            cat "$template_file" | sed "s/{{PROJECT}}/${PROJECT_NAME}/g"
            echo -e "${YELLOW}═══════════════════════════════════════${NC}"
            ;;
        3)
            cat "$template_file" | sed "s/{{PROJECT}}/${PROJECT_NAME}/g" > "$OUTPUT_FILE"
            echo -e "${GREEN}✅ Saved to: ${OUTPUT_FILE}${NC}"
            ;;
        4)
            cat "$template_file" | sed "s/{{PROJECT}}/${PROJECT_NAME}/g" > "$OUTPUT_FILE"
            ${EDITOR:-nano} "$OUTPUT_FILE"
            echo -e "${GREEN}✅ Saved to: ${OUTPUT_FILE}${NC}"
            ;;
    esac

    echo ""
    echo -e "${BLUE}Press Enter to continue...${NC}"
    read -r
}

# View recent documents
view_recent() {
    echo -e "${CYAN}Recent Documents:${NC}"
    echo ""
    ls -lt "$TASKS_DIR"/*.md 2>/dev/null | head -10 | while read -r line; do
        echo "  $line"
    done
    echo ""
    echo -e "${BLUE}Press Enter to continue...${NC}"
    read -r
}

# Main loop
while true; do
    clear
    show_menu
    echo -e "${BLUE}Enter choice [0-17]: ${NC}"
    read -r choice

    case $choice in
        1) process_template "$TEMPLATES_DIR/create-prd.md" "prd" "PRD" ;;
        2) process_template "$TEMPLATES_DIR/create-brd.md" "brd" "BRD" ;;
        3) process_template "$TEMPLATES_DIR/create-rfc.md" "rfc" "RFC" ;;
        4) process_template "$TEMPLATES_DIR/create-tech-spec.md" "tech-spec" "Technical Specification" ;;
        5) process_template "$TEMPLATES_DIR/create-design-doc.md" "design" "Design Document" ;;
        6) process_template "$TEMPLATES_DIR/create-api-spec.md" "api" "API Specification" ;;
        7) process_template "$TEMPLATES_DIR/create-database-schema.md" "db-schema" "Database Schema" ;;
        8) process_template "$TEMPLATES_DIR/create-user-story.md" "user-story" "User Stories" ;;
        9) process_template "$TEMPLATES_DIR/create-runbook.md" "runbook" "Runbook" ;;
        10) process_template "$TEMPLATES_DIR/create-post-mortem.md" "post-mortem" "Post-Mortem" ;;
        11) process_template "$TEMPLATES_DIR/create-sop.md" "sop" "SOP" ;;
        12) process_template "$TEMPLATES_DIR/create-project-charter.md" "charter" "Project Charter" ;;
        13) process_template "$TEMPLATES_DIR/create-raci-matrix.md" "raci" "RACI Matrix" ;;
        14) process_template "$TEMPLATES_DIR/create-risk-register.md" "risk" "Risk Register" ;;
        15) "$SCRIPT_DIR/generate-tasks.sh" ;;
        16) "$SCRIPT_DIR/process-tasks.sh" ;;
        17) view_recent ;;
        0)
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            sleep 1
            ;;
    esac
done