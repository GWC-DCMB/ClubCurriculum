#!/bin/sh

function install() {
    sudo apt-get update
    sudo apt-get install texlive-xetex pandoc
    sudo pip install --upgrade pip
    sudo pip install jupyter
}
function compile() {
    last_compile_commit=$(git log --oneline | grep "Compile PDFs " | head -n 1 | cut -f 1 -d " ")
    notebooks=$(git diff --name-only $last_compile_commit HEAD | grep "Keys.*ipynb")
    for file in $notebooks
    do
        outdir=$(echo $file | sed "s|\(^.*/\).*$|\1|")pdf/
        jupyter nbconvert --to pdf --output-dir=$outdir $file
    done
}
function commit() {
    git config user.email "kellysovacool@gmail.com"
    git config user.name "Kelly Sovacool"
    git add Lessons/Keys/pdf Practices/Keys/pdf
    if [ $(git diff --staged --name-only) ]
    then
        git commit -m "Compile PDFs [ci skip]"
        git push
    fi
}

install
set -e
compile
commit
