#make-release

PROJNAME=main
BUILD_DIR=build
PDFS_DIR=pdfs

PDFLATEX=pdflatex
LUALATEX=lualatex
XELATEX=xelatex

PDFLATEX_BUILD_DIR=$(BUILD_DIR)/$(PDFLATEX)
LUALATEX_BUILD_DIR=$(BUILD_DIR)/$(LUALATEX)
XELATEX_BUILD_DIR=$(BUILD_DIR)/$(XELATEX)

LATEX=$(PDFLATEX)
LATEXOPT=-synctex=1
NONSTOP=--interaction=nonstopmode
LATEX_BUILD_DIR=$(PDFLATEX_BUILD_DIR)

LATEXMK=latexmk
LATEXMKOPT=-bibtex -pdf

TEXENV=$(shell ./get-texenv.sh)

.PHONY: all clean lua pdf release xetex 

all: pdf lua xetex

clean:  $(RM) *.app *.aux *.bbl *.blg 
        $(RM) *.fdb_latexmk *.fls 
        $(RM) *.gz *.lof *.log *.lot *.out 
        $(RM) *.toc *.xml *-blx.bib *.pdf 
        $(RM) -r $(BUILD_DIR)
        $(RM) $(PROJNAME).pdf
        latexmk -silent -C -bibtex
        $(RM) *.run.xml *.synctex.gz
        $(RM) *.bbl

lua:    $(PROJNAME).tex
        $(MAKE) base LATEX=$(LUALATEX) LATEX_BUILD_DIR=$(LUALATEX_BUILD_DIR)

pdf:    $(PROJNAME).tex
        $(MAKE) base LATEX=$(PDFLATEX) LATEX_BUILD_DIR=$(PDFLATEX_BUILD_DIR)

xetex:  $(PROJNAME).tex
        $(MAKE) base LATEX=$(XELATEX) LATEX_BUILD_DIR=$(XELATEX_BUILD_DIR)

base:   $(LATEXMK) $(LATEXMKOPT) -output-directory=$(LATEX_BUILD_DIR) \
            -pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" -use-make $<
        cp $(LATEX_BUILD_DIR)/$(PROJNAME).pdf .
        mkdir -p $(PDFS_DIR)
        cp $(PROJNAME).pdf $(PDFS_DIR)/$(TEXENV)-$(LATEX).pdf
