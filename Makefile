BUILD_DIR 	= build
PDFS_DIR 	= pdfs
RELEASE_DIR = releases

LATEXMK 	= latexmk
MKFLAGS 	= -bibtex -pdf

PDFLATEX 	= pdflatex
LUALATEX 	= lualatex
XELATEX 	= xelatex
TEXFLAGS 	= -synctex=1 --interaction=nonstopmode

TEXENV		= $(shell ./scripts/texenv.sh)

.PHONY: base clean

# Generate all three PDFs
all: 	pdf xetex lua 

# Remove LaTeX auxiliary files
clean:  
		$(RM) *.app *.aux *.bbl *.blg 
		$(RM) *.fdb_latexmk *.fls *.gz 
		$(RM) *.lof *.log *.lot *.out *.status
		$(RM) *.toc *.xml *-blx.bib *.pdf 
		$(RM) -r $(BUILD_DIR)/*
		$(RM) -r $(PDFS_DIR)/*

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
		mkdir -p $(PDFS_DIR)
		cp ./$(OUT)/*.pdf ./$(PDFS_DIR)/$(TEXENV)-$(CTEX).pdf
