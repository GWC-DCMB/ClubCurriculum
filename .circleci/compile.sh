#!/bin/sh

last_compile_commit=$(git log --oneline | grep "[ci skip]" | head -n 1 | cut -f 1 -d " ")
notebooks_changed=$(git diff --name-only $last_compile_commit HEAD | grep "*ipynb")
if [ notebooks_changed ]
then
    # install dependences
    sudo apt-get update
    sudo apt-get install texlive-xetex pandoc
    sudo pip install --upgrade pip
    sudo pip install jupyter

    for file in $notebooks_changed
    do
        # strip colab metadata & enforce indentation style
        python strip_colab_metadata.py $file
        # compile PDFs
        if [[ *"KEY"* == $file ]]
        then
            outdir=$(echo $file | sed "s|\(^.*/\).*$|\1|")pdf/
            jupyter nbconvert --to pdf --output-dir=$outdir $file
        fi
    done

    # commit new PDFs
    git config user.email "kellysovacool@gmail.com"
    git config user.name "Kelly Sovacool"
    git add */_Keys/pdf/
    git commit -m "Compile PDFs [ci skip]"
    git add *
    git commit -m "Strip colab metadata & enforce ipynb format [ci skip]"
    git push
fi
