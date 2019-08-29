#!/bin/sh

last_compile_commit=$(git log --oneline | grep "Compile PDFs " | head -n 1 | cut -f 1 -d " ")
notebooks=$(git diff --name-only $last_compile_commit HEAD | grep "Keys.*ipynb")
for file in $notebooks
do
    outdir=$(echo $file | sed "s|\(^.*/\).*$|\1|")pdf/
    jupyter nbconvert --to pdf --output-dir=$outdir $file
done
