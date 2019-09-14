#!/bin/bash

xelatex -synctex=1 -interaction=nonstopmode --admin "main".tex
bibtex --admin "main"
xelatex -synctex=1 -interaction=nonstopmode --admin "main".tex
xelatex -synctex=1 -interaction=nonstopmode --admin "main".tex
