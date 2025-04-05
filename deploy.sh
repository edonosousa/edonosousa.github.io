#!/bin/bash

echo "í» ï¸ Building Jekyll site..."
bundle exec jekyll build

echo "íº€ Deploying to gh-pages branch..."

cd _site

if [ ! -d ".git" ]; then
  git init
  git checkout -b gh-pages
else
  git checkout gh-pages
fi

git remote get-url origin &>/dev/null || git remote add origin git@github-edonosousa:edonosousa/edonosousa.github.io.git

git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
git push -f origin gh-pages

cd ..

echo "âœ… Deployed to GitHub Pages!"
