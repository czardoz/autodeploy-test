#!/usr/bin/env bash
# ----------------------------------------------------------------------------------------------------------------------
# This script is intended be run from CI servers, and publish documentation to gh-pages branch
# ----------------------------------------------------------------------------------------------------------------------

# Stop on first error
set -e;

# run our compile script, discussed above
mkdir out
echo "my docs" > out/docs.txt

# go to the out directory and create a *new* Git repo
cd out
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Doc Publisher"
git config user.email "autocommit@example.com"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force "git@github.com:czardoz/autodeploy-test.git" master:gh-pages
