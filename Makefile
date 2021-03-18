# *************************************
# WUT-Thesis Makefile build targets
# *************************************

BUILD_DIR 	= build
PDFS_DIR    = pdfs
RELEASE_DIR = releases

LATEXMK 	= latexmk
MKFLAGS 	= -bibtex -pdf -f

PDFLATEX 	= pdflatex
LUALATEX 	= lualatex
XELATEX 	= xelatex
TEXFLAGS 	= -synctex=1 --interaction=nonstopmode

TEXENV		= $(shell ./src/scripts/texenv.sh)

.PHONY: base clean

# Generate all three PDFs
all: 	pdf lua xetex

# Remove LaTeX auxiliary files
clean:
		rm -f *.app *.aux *.bbl *.bcf *.blg
		rm -f *.fdb_latexmk *.fls *.gz
		rm -f *.lof *.log *.lot *.out *.status
		rm -f *.toc *.xml *-blx.bib *.pdf

		rm -rf $(BUILD_DIR)
		mkdir -p $(BUILD_DIR)
		mkdir -p $(BUILD_DIR)/$(PDFS_DIR)

# Generate LuaLateX PDF
lua:	*.tex *.bib ./tex/*
		$(MAKE) base CTEX=$(LUALATEX) OUT=$(BUILD_DIR)/$(LUALATEX)

# Generate pdfLaTeX PDF
pdf:	*.tex *.bib ./tex/*
		$(MAKE) base CTEX=$(PDFLATEX) OUT=$(BUILD_DIR)/$(PDFLATEX)

# Generate XeLaTeX PDF
xetex:	*.tex *.bib ./tex/*
		$(MAKE) base CTEX=$(XELATEX) OUT=$(BUILD_DIR)/$(XELATEX)

# Make release tarball
release:
		./scripts/make-release.sh $(version)

# Template of building command
base:
		$(LATEXMK) $(MKFLAGS) \
			-output-directory=$(OUT) \
			-pdflatex="$(CTEX) $(TEXFLAGS)" $<
		cp -v ./$(OUT)/*.pdf ./$(BUILD_DIR)/$(PDFS_DIR)/$(TEXENV)-$(CTEX).pdf
