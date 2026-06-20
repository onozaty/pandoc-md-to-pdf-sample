#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec mmdc \
  -p "$SCRIPT_DIR/../pandoc/puppeteer-config.json" \
  -c "$SCRIPT_DIR/../pandoc/mermaid-config.json" \
  "$@"
