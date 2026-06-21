#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

export MERMAID_BIN="$SCRIPT_DIR/mmdc-wrapper.sh"

mkdir -p "$PROJECT_ROOT/output"

success=0
failure=0

for md in "$PROJECT_ROOT/docs/"*.md; do
    base="$(basename "$md" .md)"
    out="$PROJECT_ROOT/output/${base}.pdf"

    echo "Converting: docs/${base}.md -> output/${base}.pdf"

    if pandoc \
        -d "$PROJECT_ROOT/pandoc/defaults.yaml" \
        "$md" \
        -o "$out"; then
        echo "  OK: ${base}.pdf"
        success=$((success + 1))
    else
        echo "  FAILED: ${base}.md"
        failure=$((failure + 1))
    fi
done

echo ""
echo "Done: ${success} succeeded, ${failure} failed"

[ "$failure" -eq 0 ]
