#!/bin/bash

# Check validity of the version number
# If the first argument passed is in format Num.Num.Num,
# return this argument.
# Return "" otherwise.
function validate_version_number() {
    local VERSION=$1
    if ! [[ $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
        then VERSION=""
    fi
    echo $VERSION
}

VERSION=$(validate_version_number $1)
if [ -z $VERSION ]
then
    echo -e "\033[31mPlease specify a valid version number in format: make release version=X.X.X\033[0m"
    exit 1
fi

# Check if release alredy exists
if [[ -d "releases/$VERSION" ]]
then
    echo -e "\033[31mDirectory releases/$VERSION already exists!\033[0m"
    exit 1
fi

# Make release archive
RELEASE_DIR="releases/$VERSION/WUT-Thesis"
mkdir -p $RELEASE_DIR
mkdir -p $RELEASE_DIR/eiti
mkdir -p $RELEASE_DIR/img
mkdir -p $RELEASE_DIR/tex

cp eiti/* $RELEASE_DIR/eiti
cp img/* $RELEASE_DIR/img
cp tex/* $RELEASE_DIR/tex
cp *.bib $RELEASE_DIR
cp *.tex $RELEASE_DIR

cp Makefile $RELEASE_DIR
cp .gitignore $RELEASE_DIR

cd releases/$VERSION
zip -r WUT-Thesis-$VERSION.zip WUT-Thesis/*
