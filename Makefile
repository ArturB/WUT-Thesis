#make-release

PROJNAME 	= main
BUILD_DIR 	= build
PDFS_DIR 	= pdfs
RELEASE_DIR = releases

LATEXMK 	= latexmk
MKFLAGS 	= -bibtex -pdf

PDFLATEX 	= pdflatex
LUALATEX 	= lualatex
XELATEX 	= xelatex
TEXFLAGS 	= -synctex=1 --interaction=nonstopmode

TEXENV		= $(shell ./get-texenv.sh)

.PHONY: base clean

# Generate all three PDFs
all: 	pdf lua xetex

# Remove LaTeX auxiliary files
clean:  
		$(RM) *.app *.aux *.bbl *.blg 
		$(RM) *.fdb_latexmk *.fls *.gz 
		$(RM) *.lof *.log *.lot *.out 
		$(RM) *.toc *.xml *-blx.bib *.pdf 
		$(RM) -r $(BUILD_DIR)/*

# Generate LuaLateX PDF
lua:	$(PROJNAME).tex
		$(MAKE) base CTEX=$(LUALATEX) OUT=$(BUILD_DIR)/$(LUALATEX)

# Generate pdfLaTeX PDF
pdf:	$(PROJNAME).tex
		$(MAKE) base CTEX=$(PDFLATEX) OUT=$(BUILD_DIR)/$(PDFLATEX)

# Generate XeLaTeX PDF
xetex:	$(PROJNAME).tex
		$(MAKE) base CTEX=$(XELATEX) OUT=$(BUILD_DIR)/$(XELATEX)

# Make release tarball
release: 
		./scripts/make-release.sh $(version)

# Template of building command
base:   
		$(LATEXMK) $(MKFLAGS) \
			-output-directory=$(OUT) \
			-pdflatex="$(CTEX) $(LATEXOPT) $(NONSTOP)" $<
		mkdir -p $(PDFS_DIR)
		cp ./$(OUT)/$(PROJNAME).pdf ./$(PDFS_DIR)/$(TEXENV)-$(CTEX).pdf
