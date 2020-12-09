#!/bin/bash

# Determine platform environment (texlive or miktex)
if [[ $OSTYPE == "linux-gnu" ]] ; then
    TEXENV="texlive"
elif [[ $OSTYPE == "msys" ]] ; then
    if [[ $(which pdftex) =~ miktex ]] ; then
        TEXENV="miktex"
    elif [[ $(which pdftex) =~ texlive ]] ; then
        TEXENV="texlive"
    fi
fi

echo "$TEXENV"
