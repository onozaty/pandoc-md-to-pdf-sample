#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

export MERMAID_BIN="$SCRIPT_DIR/mmdc-wrapper.sh"

mkdir -p "$PROJECT_ROOT/output"

pandoc \
  -d "$PROJECT_ROOT/pandoc/defaults.yaml" \
  "$PROJECT_ROOT/docs/sample.md" \
  -o "$PROJECT_ROOT/output/sample.pdf"

echo "Generated: output/sample.pdf"
