#!/bin/bash

pdflatex -synctex=1 -interaction=nonstopmode --admin "main".tex
bibtex --admin "main"
pdflatex -synctex=1 -interaction=nonstopmode --admin "main".tex
pdflatex -synctex=1 -interaction=nonstopmode --admin "main".tex
