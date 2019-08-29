#!/bin/sh

git config user.email "kellysovacool@gmail.com"
git config user.name "Kelly Sovacool"
git add Lessons/Keys/pdf Practices/Keys/pdf
if [ $(git diff --staged --name-only) ]
then
    git commit -m "Compile PDFs [ci skip]"
    git push
fi
