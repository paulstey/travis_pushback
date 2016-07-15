#!/bin/sh

setup_git() {
  git config --global user.email ${GH_EMAIL}
  git config --global user.name ${GH_USERNAME}
}

commit_files() {
  git checkout -b gh-pages
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER [ci skip]"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/paulstey/${GH_REPONAME}.git
  git push --quiet --set-upstream --force origin-pages gh-pages
}

setup_git
commit_files
upload_files
