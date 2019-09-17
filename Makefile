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

.PHONY: pdf lua xetex all clean

all: pdf lua xetex

main:
	$(LATEXMK) $(LATEXMKOPT) -output-directory=$(LATEX_BUILD_DIR) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" -use-make $<
	cp $(LATEX_BUILD_DIR)/$(PROJNAME).pdf .
	mkdir -p $(PDFS_DIR)
	cp $(PROJNAME).pdf $(PDFS_DIR)/$(TEXENV)-$(LATEX).pdf

pdf: $(PROJNAME).tex
	$(MAKE) main LATEX=$(PDFLATEX) LATEX_BUILD_DIR=$(PDFLATEX_BUILD_DIR)

lua: $(PROJNAME).tex
	$(MAKE) main LATEX=$(LUALATEX) LATEX_BUILD_DIR=$(LUALATEX_BUILD_DIR)

xetex: $(PROJNAME).tex
	$(MAKE) main LATEX=$(XELATEX) LATEX_BUILD_DIR=$(XELATEX_BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(PROJNAME).pdf
