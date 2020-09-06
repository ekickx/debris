#!/usr/bin/env bash

modify_readme(){
  # Download json file
  wget -O fact.json "https://uselessfacts.jsph.pl/$1.json?language=en"

  # Initialize var
  text="$(jq '.text' fact.json)"
  src="$(jq '.source' fact.json)"
  src_url="$(jq '.source_url' fact.json)"

  start="<!--START_SECTION:debris-->"
  end="<!--END_SECTION:debris-->"

  # Delete all text between $start and $end
  sed -i "/$start/,/$end/{//!d}" "$(ls | grep -i readme)"

  # Put $text in the newline after $start
  sed -i "/$start/ s/$/ \n$text/" "$(ls | grep -i readme)"

  # Delete fact.json
  rm fact.json
}

# Git initialization
repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config user.name "Github Action"
git config user.email "actions@user.noreply.github.com"

git checkout master
modify_readme "$1"
git add -A
git commit -m "Add some fact"
git push $repo master


