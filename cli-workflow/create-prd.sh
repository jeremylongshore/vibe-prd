#!/bin/bash
# Create PRD using CLI workflow

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TASKS_DIR="$PROJECT_ROOT/tasks"
TEMPLATE="$PROJECT_ROOT/professional-templates/create-prd.md"

# Create tasks directory if it doesn't exist
mkdir -p "$TASKS_DIR"

# Function to display usage
usage() {
    echo -e "${BLUE}Usage: $0 [feature-name]${NC}"
    echo -e "Example: $0 'user authentication'"
    echo -e "\nThis will create a PRD for your feature and save it to tasks/"
    exit 1
}

# Check if feature name provided
if [ $# -eq 0 ]; then
    echo -e "${YELLOW}Enter feature name: ${NC}"
    read -r FEATURE_NAME
else
    FEATURE_NAME="$1"
fi

# Sanitize feature name for filename
SAFE_NAME=$(echo "$FEATURE_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g')
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTPUT_FILE="$TASKS_DIR/prd-${SAFE_NAME}-${TIMESTAMP}.md"

echo -e "${GREEN}🚀 Creating PRD for: ${FEATURE_NAME}${NC}"
echo -e "${BLUE}Template: ${TEMPLATE}${NC}"
echo -e "${BLUE}Output: ${OUTPUT_FILE}${NC}"
echo ""

# Display template with feature name substituted
echo -e "${YELLOW}Copy the following to your AI assistant:${NC}"
echo -e "${YELLOW}═══════════════════════════════════════${NC}"
echo ""

# Process template
sed "s/{{FEATURE_NAME}}/${FEATURE_NAME}/g" "$TEMPLATE" | tee "$OUTPUT_FILE.prompt"

echo ""
echo -e "${YELLOW}═══════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}✅ Prompt saved to: ${OUTPUT_FILE}.prompt${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Copy the above to Claude/ChatGPT/etc"
echo "2. Save the response to: ${OUTPUT_FILE}"
echo "3. Generate tasks: ./cli-workflow/generate-tasks.sh ${OUTPUT_FILE}"
echo ""
echo -e "${BLUE}Or paste your PRD here (press Ctrl+D when done):${NC}"

# Read PRD from user
PRD_CONTENT=$(cat)

if [ -n "$PRD_CONTENT" ]; then
    echo "$PRD_CONTENT" > "$OUTPUT_FILE"
    echo -e "${GREEN}✅ PRD saved to: ${OUTPUT_FILE}${NC}"

    # Open in editor if EDITOR is set
    if [ -n "$EDITOR" ]; then
        echo -e "${BLUE}Opening in $EDITOR...${NC}"
        $EDITOR "$OUTPUT_FILE"
    fi
fi