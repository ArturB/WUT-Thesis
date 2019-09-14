#!/bin/bash

lualatex -synctex=1 -interaction=nonstopmode "main".tex
bibtex "main"
lualatex -synctex=1 -interaction=nonstopmode "main".tex
lualatex -synctex=1 -interaction=nonstopmode "main".tex
