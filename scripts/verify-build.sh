#!/bin/bash

set -e

case $1 in
    lua)
        pdftotext ./pdfs/texlive-lualatex.pdf ./pdfs/texlive-lualatex.txt
        diff ./pdfs/texlive-lualatex.txt ./releases/referential/referential-lualatex.txt
        ;;
    pdf)
        pdftotext ./pdfs/texlive-pdflatex.pdf ./pdfs/texlive-pdflatex.txt
        diff ./pdfs/texlive-pdflatex.txt ./releases/referential/referential-pdflatex.txt
        ;;
    xetex)
        pdftotext ./pdfs/texlive-xelatex.pdf ./pdfs/texlive-xelatex.txt
        diff ./pdfs/texlive-xelatex.txt ./releases/referential/referential-xelatex.txt
        ;;
    *)
        echo Unknown LaTeX compiler!
        exit 1
        ;;
esac
