#!/bin/bash
# Quick deploy script for GitHub Pages

set -e

echo "🚀 Building and deploying to GitHub Pages..."

# Activate virtual environment
source ../venv/bin/activate

# Build production site
make build-prod

# Commit and push
git add -A
git commit -m "Deploy: $(date +'%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"
git push origin main

echo "✅ Deployment triggered! Check GitHub Actions for progress."
echo "🌐 Site will be available at: https://yoloinfinity55.github.io/pelicanai"
