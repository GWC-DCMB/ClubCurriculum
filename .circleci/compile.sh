#!/bin/sh
set -e
jupyter nbconvert --to pdf --output-dir='Lessons/Keys/pdf' Lessons/Keys/*.ipynb
jupyter nbconvert --to pdf --output-dir='Practices/Keys/pdf' Practices/Keys/*.ipynb
git config user.email "kellysovacool@gmail.com"
git config user.name "Kelly Sovacool"
git add Lessons/Keys/pdf Practices/Keys/pdf
git commit -m "Compile PDFs [ci skip]"
git push
