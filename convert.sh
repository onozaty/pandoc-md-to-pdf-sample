#!/bin/bash
set -e

IMAGE=ghcr.io/onozaty/pandoc-mermaid-ja:1.0.1

mkdir -p output

for md in docs/*.md; do
  filename=$(basename "$md" .md)
  echo "Converting $md -> output/${filename}.pdf"
  docker run --rm -v "$PWD":/data "$IMAGE" "$md" -o "output/${filename}.pdf"
done

echo "Done."
