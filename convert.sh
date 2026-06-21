#!/bin/bash
set -e

mkdir -p output

for md in docs/*.md; do
  filename=$(basename "$md" .md)
  echo "Converting $md -> output/${filename}.pdf"
  docker run --rm -v "$PWD":/data ghcr.io/onozaty/pandoc-mermaid-ja "$md" -o "output/${filename}.pdf"
done

echo "Done."
