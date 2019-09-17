#!/bin/bash

# Create pdfs directory if not exist
mkdir -p pdfs
# Clear eventual LaTeX auxiliary files
./clear.sh
# Determine platform environment (texlive or miktex)
if [[ $OSTYPE == "linux-gnu" ]] ; then
	TEXENV="texlive"
else
	if [[ $(which pdftex) =~ miktex ]] ; then
		TEXENV="miktex"
	else
		TEXENV="texlive"
	fi
fi

if [ -z TEXENV ] ; then
	echo Unable to determine the environment! Exit...
	exit 1
fi

echo "$TEXENV"