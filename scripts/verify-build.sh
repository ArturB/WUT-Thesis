#!/bin/bash

set -e

case $1 in
    lua)
        pdftotext ./pdfs/texlive-lualatex.pdf ./pdfs/texlive-lualatex.txt
        cmp ./pdfs/texlive-lualatex.txt ./releases/referential/referential-lualatex.txt
        ;;
    pdf)
        pdftotext ./pdfs/texlive-pdflatex.pdf ./pdfs/texlive-pdflatex.txt
        cmp ./pdfs/texlive-pdflatex.txt ./releases/referential/referential-pdflatex.txt
        ;;
    xetex)
        pdftotext ./pdfs/texlive-xelatex.pdf ./pdfs/texlive-xelatex.txt
        cmp ./pdfs/texlive-xelatex.txt ./releases/referential/referential-xelatex.txt
        ;;
    *)
        echo Unknown LaTeX compiler!
        exit 1
esac
