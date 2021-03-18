# -------------------------------------
# WUT-Thesis Makefile build targets
# -------------------------------------

BUILD_DIR = build
PDFS_DIR  = pdfs

MKFLAGS   = -bibtex -pdf -f
TEXFLAGS  = -synctex=1 --interaction=nonstopmode

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
		$(MAKE) base CTEX=lualatex OUT=$(BUILD_DIR)/lualatex

# Generate pdfLaTeX PDF
pdf:	*.tex *.bib ./tex/*
		$(MAKE) base CTEX=pdflatex OUT=$(BUILD_DIR)/pdflatex

# Generate XeLaTeX PDF
xetex:	*.tex *.bib ./tex/*
		$(MAKE) base CTEX=xelatex OUT=$(BUILD_DIR)/xelatex

# Make release tarball
release:
		./src/scripts/make-release.sh $(version)

# General building command
base:
		latexmk $(MKFLAGS) \
			-output-directory=$(OUT) \
			-pdflatex="$(CTEX) $(TEXFLAGS)" $<
		cp -v ./$(OUT)/*.pdf ./$(BUILD_DIR)/$(PDFS_DIR)/main-$(CTEX).pdf
