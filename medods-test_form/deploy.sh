#!/usr/bin/env sh

set -e

# build
npm run build

# navigate into the build output directory
cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:maslonyam/medods-test_form.git master:gh-pages

cd -