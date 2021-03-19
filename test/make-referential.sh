#!/bin/bash

set -e

pdftotext $1 $1.txt
cat $1.txt | tr -d "[:space:]" | tr -d "[:digit:]" | tr -d '-' | tr -d '.' | tr -s "eE" "\n" > $1_referential.txt
rm $1.txt
echo "Generated referential:"
echo "----------------------"
cat $1_referential.txt
echo -e "\n----------------------"
