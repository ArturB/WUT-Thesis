#!/bin/bash

set -e

PDFS_DIR="./build/pdfs"
REFERENTIAL_DIR="./test/referential"

case $1 in

    lua)
        pdftotext $PDFS_DIR/texlive-lualatex.pdf $PDFS_DIR/texlive-lualatex.txt
        cat $PDFS_DIR/texlive-lualatex.txt | tr -d "[:space:]" | tr -s "eE" "\n" > $PDFS_DIR/texlive-lualatex_tr.txt
        echo "Generated pdf:"
        echo "----------------------"
        cat $PDFS_DIR/texlive-lualatex_tr.txt
        echo -e "\n----------------------"
        echo -e "Differences with referential text:\n"
        diff $PDFS_DIR/texlive-lualatex_tr.txt $REFERENTIAL_DIR/referential-lualatex_tr.txt
        rm $PDFS_DIR/*.txt
        echo "All done!"
        ;;
    
    pdf)
        pdftotext $PDFS_DIR/texlive-pdflatex.pdf $PDFS_DIR/texlive-pdflatex.txt
        cat $PDFS_DIR/texlive-pdflatex.txt | tr -d "[:space:]" | tr -s "eE" "\n" > $PDFS_DIR/texlive-pdflatex_tr.txt
        echo "Generated pdf:"
        echo "----------------------"
        cat $PDFS_DIR/texlive-pdflatex_tr.txt
        echo -e "\n----------------------"
        echo -e "Differences with referential text:\n"
        diff $PDFS_DIR/texlive-pdflatex_tr.txt $REFERENTIAL_DIR/referential-pdflatex_tr.txt
        rm $PDFS_DIR/*.txt
        echo "All done!"
        ;;
    
    xetex)
        pdftotext $PDFS_DIR/texlive-xelatex.pdf $PDFS_DIR/texlive-xelatex.txt
        cat $PDFS_DIR/texlive-xelatex.txt | tr -d "[:space:]" | tr -s "eE" "\n" > $PDFS_DIR/texlive-xelatex_tr.txt
        echo "Generated pdf:"
        echo "----------------------"
        cat $PDFS_DIR/texlive-xelatex_tr.txt
        echo -e "\n----------------------"
        echo -e "Differences with referential text:\n"
        diff $PDFS_DIR/texlive-xelatex_tr.txt $REFERENTIAL_DIR/referential-xelatex_tr.txt
        rm $PDFS_DIR/*.txt
        echo "All done!"
        ;;
    
    *)
        echo Unknown LaTeX compiler!
        exit 1
        ;;
    
esac
