#!/bin/bash

lualatex -synctex=1 -interaction=nonstopmode --admin "main".tex
bibtex --admin "main"
lualatex -synctex=1 -interaction=nonstopmode --admin "main".tex
lualatex -synctex=1 -interaction=nonstopmode --admin "main".tex
