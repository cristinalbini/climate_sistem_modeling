#!/bin/bash

# Imposta la directory di lavoro
WORKDIR=$(pwd)

# Nome del file principale (senza estensione .tex)
TEXFILE="main"  # Cambia questo se il tuo file LaTeX ha un nome diverso

# Compila il documento LaTeX (prima passata)
echo "Compiling LaTeX document..."
pdflatex -interaction=nonstopmode -output-directory=$WORKDIR $TEXFILE.tex

# Se stai usando BibTeX per la bibliografia
if [ -f "$TEXFILE.bib" ]; then
    echo "Running BibTeX..."
    bibtex $TEXFILE
    pdflatex -interaction=nonstopmode -output-directory=$WORKDIR $TEXFILE.tex
    pdflatex -interaction=nonstopmode -output-directory=$WORKDIR $TEXFILE.tex
fi

# Controlla se il file PDF è stato generato
if [ -f "$TEXFILE.pdf" ]; then
    echo "PDF successfully generated: $TEXFILE.pdf"
else
    echo "Error: PDF generation failed."
    exit 1
fi

