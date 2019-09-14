#!/bin/bash

xelatex -synctex=1 -interaction=nonstopmode "main".tex
bibtex "main"
xelatex -synctex=1 -interaction=nonstopmode "main".tex
xelatex -synctex=1 -interaction=nonstopmode "main".tex
