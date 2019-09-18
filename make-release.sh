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

# Get version number from user and check validity
function get_version_number() {
    while [ -z $VERSION ]
    do
        echo -n "Please specify a valid version number in format Num.Num.Num:  "
        read VERSION
        VERSION=$(validate_version_number $VERSION)
    done
    echo $VERSION
}

VERSION=$(validate_version_number $1)
if [ -z $VERSION ] 
then
    get_version_number
fi

# Check if release alredy exists
if [[ -d "releases/$VERSION" ]] 
then 
    echo -e Directory releases/$VERSION already exists!
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
tar -cvf WUT-Thesis.tar.gz WUT-Thesis/*
