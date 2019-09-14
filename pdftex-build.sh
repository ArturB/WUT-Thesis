#!/bin/bash

pdflatex -synctex=1 -interaction=nonstopmode "main".tex $@
bibtex "main"
pdflatex -synctex=1 -interaction=nonstopmode "main".tex $@
pdflatex -synctex=1 -interaction=nonstopmode "main".tex $@
