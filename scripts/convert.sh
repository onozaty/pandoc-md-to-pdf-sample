#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

export MERMAID_BIN="$SCRIPT_DIR/mmdc-wrapper.sh"

mkdir -p "$PROJECT_ROOT/output"

pandoc \
  -d "$PROJECT_ROOT/pandoc/defaults.yaml" \
  "$PROJECT_ROOT/docs/basic-design.md" \
  -o "$PROJECT_ROOT/output/basic-design.pdf"

echo "Generated: output/basic-design.pdf"
