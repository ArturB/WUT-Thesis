#!/bin/bash

set -e

case $1 in
    lua)
        pdftotext ./pdfs/texlive-lualatex.pdf ./pdfs/texlive-lualatex.txt
        cat ./pdfs/texlive-lualatex.txt | tr -d "[:space:]" > ./pdfs/texlive-lualatex_tr.txt
        cat ./pdfs/texlive-lualatex_tr.txt
        echo "----------------------"
        diff ./pdfs/texlive-lualatex_tr.txt ./releases/referential/referential-lualatex.txt
        ;;
    pdf)
        pdftotext ./pdfs/texlive-pdflatex.pdf ./pdfs/texlive-pdflatex.txt
        cat ./pdfs/texlive-pdflatex.txt | tr -d "[:space:]" > ./pdfs/texlive-pdflatex_tr.txt
        cat ./pdfs/texlive-pdflatex_tr.txt
        echo "----------------------"
        diff ./pdfs/texlive-pdflatex_tr.txt ./releases/referential/referential-pdflatex.txt
        ;;
    xetex)
        pdftotext ./pdfs/texlive-xelatex.pdf ./pdfs/texlive-xelatex.txt
        cat ./pdfs/texlive-xelatex.txt | tr -d "[:space:]" > ./pdfs/texlive-xelatex_tr.txt
        cat ./pdfs/texlive-xelatex_tr.txt
        echo "----------------------"
        diff ./pdfs/texlive-xelatex_tr.txt ./releases/referential/referential-xelatex.txt
        ;;
    *)
        echo Unknown LaTeX compiler!
        exit 1
        ;;
esac
