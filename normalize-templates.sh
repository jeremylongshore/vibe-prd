#!/bin/bash

# Template normalization script
# Date for stamping
TODAY=$(date +%Y-%m-%d)

echo "Starting template normalization with date: $TODAY"

# Counter for files
count=0
no_related_docs=""

# Process each template
for file in professional-templates/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "Processing $filename..."

        # Create a temporary file
        tmpfile=$(mktemp)

        # Get the H1 title (first line starting with #)
        title=$(grep -m1 "^# " "$file")

        # Extract cross-links if they exist
        related_docs=""
        if grep -q "Cross-links:" "$file"; then
            # Extract the cross-links line and clean it up
            crosslinks=$(grep "Cross-links:" "$file" | sed 's/.*Cross-links: *//' | sed 's/See //')
            if [ ! -z "$crosslinks" ] && [ "$crosslinks" != "" ]; then
                # Convert semicolons to commas, trim whitespace
                related_docs=$(echo "$crosslinks" | sed 's/;/,/g' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
            fi
        fi

        # Write the new file structure
        echo "$title" > "$tmpfile"
        echo "" >> "$tmpfile"
        echo "**Metadata**" >> "$tmpfile"
        echo "- Last Updated: $TODAY" >> "$tmpfile"
        echo "- Maintainer: AI-Dev Toolkit" >> "$tmpfile"

        # Add Related Docs if they exist
        if [ ! -z "$related_docs" ]; then
            echo "- Related Docs: $related_docs" >> "$tmpfile"
        else
            no_related_docs="$no_related_docs $filename"
        fi

        echo "" >> "$tmpfile"

        # Skip old metadata lines and append the rest of the content
        awk '
            BEGIN { skip = 0; found_title = 0 }
            /^# / {
                if (!found_title) {
                    found_title = 1
                    skip = 1
                    next
                }
            }
            found_title && /^\*\*Last Updated:/ { skip = 1; next }
            found_title && /^\*\*Maintainer:/ { skip = 1; next }
            found_title && /^\*\*Upstream/ { skip = 1; next }
            found_title && /^\*\*Cross-links:/ { skip = 1; next }
            found_title && /^[[:space:]]*$/ && skip { skip = 0; next }
            found_title && !skip { print }
            !found_title { next }
        ' "$file" >> "$tmpfile"

        # Replace {{DATE}} placeholders
        sed -i "s/{{DATE}}/$TODAY/g" "$tmpfile"

        # Remove dangling "(BMAD)" tokens that are just provenance
        sed -i 's/ (BMAD)//g' "$tmpfile"
        sed -i 's/(BMAD) //g' "$tmpfile"

        # Move the temp file to replace the original
        mv "$tmpfile" "$file"

        count=$((count + 1))
    fi
done

echo ""
echo "=== Normalization Complete ==="
echo "Files updated: $count"
echo "Files without related docs:$no_related_docs"
echo ""
echo "Running verification checks..."

# Verification checks
echo ""
echo "Check 1: Looking for {{DATE}} placeholders..."
grep -R "{{DATE}}" professional-templates || echo "✓ No {{DATE}} placeholders found"

echo ""
echo "Check 2: Looking for Upstream (BMAD) references..."
grep -R "Upstream (BMAD)" professional-templates || echo "✓ No Upstream (BMAD) references found"

echo ""
echo "Check 3: Verifying all files have **Metadata** blocks..."
missing_metadata=""
for f in professional-templates/*.md; do
    if ! awk 'NR<=15' "$f" | grep -q "\*\*Metadata\*\*"; then
        missing_metadata="$missing_metadata $(basename $f)"
    fi
done

if [ -z "$missing_metadata" ]; then
    echo "✓ All files have **Metadata** blocks"
else
    echo "✗ Files missing **Metadata** blocks:$missing_metadata"
fi

echo ""
echo "Date used: $TODAY"