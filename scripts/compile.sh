#!/bin/bash

filename="zeth-protocol-specification"

pdflatex ${filename}.tex && \
bibtex ${filename} && \

# Generate the glossary
makeglossaries ${filename} && \
# Generate the nomenclature
makeindex ${filename}.nlo -s nomencl.ist -o ${filename}.nls && \

bibtex ${filename} && \
pdflatex ${filename}.tex && \
pdflatex ${filename}.tex
