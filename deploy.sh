#!/bin/bash
set -e

cd "$(dirname "$0")"

echo "Building Hugo site..."
hugo

cd public

echo "Committing changes..."
git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M')" || echo "No changes to commit"

echo "Pushing to GitHub..."
git push

echo "Done! Blog updated."
