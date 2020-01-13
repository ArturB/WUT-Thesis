BUILD_DIR 	= build
RELEASE_DIR = releases
PDFS_DIR    = pdfs/local
LATEXMK 	= latexmk
MKFLAGS 	= -bibtex -pdf -f

PDFLATEX 	= pdflatex
LUALATEX 	= lualatex
XELATEX 	= xelatex
TEXFLAGS 	= -synctex=1 --interaction=nonstopmode

TEXENV		= $(shell ./scripts/texenv.sh)

.PHONY: base clean

# Generate all three PDFs
all: 	pdf lua xetex

# Remove LaTeX auxiliary files
clean:
		rm -f *.app *.aux *.bbl *.blg
		rm -f *.fdb_latexmk *.fls *.gz
		rm -f *.lof *.log *.lot *.out *.status
		rm -f *.toc *.xml *-blx.bib *.pdf

		rm -rf $(BUILD_DIR)
		mkdir -p $(BUILD_DIR)
		rm -rf $(PDFS_DIR)
		mkdir -p $(PDFS_DIR)

# Generate LuaLateX PDF in polish
lua:	*.tex *.bib ./tex/*
		$(MAKE) base CTEX=$(LUALATEX) OUT=$(BUILD_DIR)/$(LUALATEX)

# Generate pdfLaTeX PDF in polish
pdf:	*.tex *.bib ./tex/*
		$(MAKE) base CTEX=$(PDFLATEX) OUT=$(BUILD_DIR)/$(PDFLATEX)

# Generate XeLaTeX PDF in polish
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
		mkdir -p $(PDFS_DIR)
		cp -v ./$(OUT)/*.pdf ./$(PDFS_DIR)/$(TEXENV)-$(CTEX).pdf
