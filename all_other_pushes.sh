#!/bin/sh

setup_git() {
    cat output.txt
    cd $HOME
    git config --global user.email "paulstey@gmail.com"
    git config --global user.name "paulstey"
    git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/paulstey/travis_pushback.git gh-pages
    cd gh-pages
}

update_file() {
    echo "\n" >> README.md
    pounds="### "
    num=`cat /home/travis/build/paulstey/travis_pushback/input.txt`
    echo "$pounds $num:" >> README.md
    cat /home/travis/build/paulstey/travis_pushback/output.txt >> README.md
}

commit_files() {
    git add --force .
    git commit --message "Travis build: $TRAVIS_BUILD_NUMBER [ci skip]"
}

upload_files() {
    git push --quiet origin gh-pages
}

setup_git
update_file
commit_files
upload_files
