#!/bin/bash
# Generate tasks from PRD using CLI workflow

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TASKS_DIR="$PROJECT_ROOT/tasks"
TEMPLATE="$PROJECT_ROOT/professional-templates/generate-tasks.md"

# Check if PRD file provided
if [ $# -eq 0 ]; then
    echo -e "${YELLOW}Available PRDs:${NC}"
    ls -1 "$TASKS_DIR"/prd-*.md 2>/dev/null || echo "No PRDs found"
    echo ""
    echo -e "${BLUE}Enter PRD file path: ${NC}"
    read -r PRD_FILE
else
    PRD_FILE="$1"
fi

# Check if file exists
if [ ! -f "$PRD_FILE" ]; then
    echo -e "${RED}Error: PRD file not found: $PRD_FILE${NC}"
    exit 1
fi

# Extract base name for task file
BASE_NAME=$(basename "$PRD_FILE" .md | sed 's/^prd-//')
OUTPUT_FILE="$TASKS_DIR/tasks-${BASE_NAME}.md"

echo -e "${GREEN}🚀 Generating tasks from PRD${NC}"
echo -e "${BLUE}PRD: ${PRD_FILE}${NC}"
echo -e "${BLUE}Output: ${OUTPUT_FILE}${NC}"
echo ""

# Create prompt with PRD content
echo -e "${YELLOW}Copy this to your AI assistant:${NC}"
echo -e "${YELLOW}═══════════════════════════════════════${NC}"
echo ""
echo "Using the following PRD, generate a detailed task list:"
echo ""
echo "---PRD START---"
cat "$PRD_FILE"
echo "---PRD END---"
echo ""
cat "$TEMPLATE"
echo ""
echo -e "${YELLOW}═══════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}Paste the generated task list here (Ctrl+D when done):${NC}"

# Read tasks from user
TASKS_CONTENT=$(cat)

if [ -n "$TASKS_CONTENT" ]; then
    echo "$TASKS_CONTENT" > "$OUTPUT_FILE"
    echo -e "${GREEN}✅ Tasks saved to: ${OUTPUT_FILE}${NC}"

    # Count tasks
    TASK_COUNT=$(grep -c "^##* Task" "$OUTPUT_FILE" || echo "0")
    echo -e "${GREEN}📊 Generated ${TASK_COUNT} tasks${NC}"

    echo ""
    echo -e "${YELLOW}Next step:${NC}"
    echo "./cli-workflow/process-tasks.sh ${OUTPUT_FILE}"
fi