# /new-project — vibe-prd guided generator

**Mode:** You are Claude Code with terminal access. Run commands locally. Be idempotent.

## Flow
1. Ask three questions:
   - starting_point: "greenfield" or "brownfield"
   - audience: "startup", "business", or "enterprise"
   - scope: "mvp" (4 docs), "standard" (12 docs), or "comprehensive" (22 docs)
2. Set PROJECT_NAME from user input (kebab-case).
3. Generate docs from the repo's professional-templates/ into completed-docs/$PROJECT_NAME/.
4. Replace {{DATE}} with today's date (YYYY-MM-DD).
5. Create index.md with links and a summary.
6. Print the output path and open the folder.

## Implementation (run these on acceptance)
- Ensure repo path:
  cd ~/ai-dev/vibe-prd

- Determine template list:
  case "$scope" in
    mvp)        TEMPLATES="01_prd.md 03_generate_tasks.md 14_project_brief.md 15_brainstorming.md" ;;
    standard)   TEMPLATES="01_prd.md 02_adr.md 03_generate_tasks.md 05_market_research.md 08_personas.md 09_user_journeys.md 10_user_stories.md 11_acceptance_criteria.md 14_project_brief.md 15_brainstorming.md 16_frontend_spec.md 17_test_plan.md" ;;
    comprehensive) TEMPLATES="$(ls professional-templates | sort)" ;;
  esac

- Create target dir:
  OUT="completed-docs/$PROJECT_NAME"
  mkdir -p "$OUT/.metadata"

- Copy and stamp:
  for f in $TEMPLATES; do
    sed "s/{{DATE}}/$(date +%F)/g" "professional-templates/$f" > "$OUT/$f"
  done

- Index:
  {
    echo "# $PROJECT_NAME — Documentation Index"
    echo
    echo "**Generated:** $(date +%F)"
    echo "**Path:** $OUT"
    echo
    echo "## Files"
    for f in $TEMPLATES; do
      echo "- [$f]($f)"
    done
    echo
    echo "## Classification"
    echo "- Starting Point: $starting_point"
    echo "- Audience: $audience"
    echo "- Scope: $scope"
  } > "$OUT/index.md"

- Metadata:
  {
    echo "{"
    echo "  \"starting_point\": \"$starting_point\","
    echo "  \"audience\": \"$audience\","
    echo "  \"scope\": \"$scope\","
    echo "  \"project_name\": \"$PROJECT_NAME\","
    echo "  \"generated_at\": \"$(date -Iseconds)\""
    echo "}"
  } > "$OUT/.metadata/generation.json"

- Finish:
  echo "Generated: $OUT"
