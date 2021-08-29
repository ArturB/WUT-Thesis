# *************************
# WUT-Thesis build targets
# *************************

import filecmp
import os
import re

TARGETS = COMMAND_LINE_TARGETS
TEXFLAGS = '-synctex=1 --interaction=nonstopmode'

# Available targets
if not TARGETS:
    print("Available targets: pdf lua clean")

# Pdflatex target
if 'pdf' in TARGETS:
    os.system("latexmk -pdf -output-directory=build/pdflatex " +
              TEXFLAGS + " main.tex")
    os.system('mkdir -p build/pdfs')
    os.system("cp -v build/pdflatex/main.pdf build/pdfs/pdflatex.pdf")

# Lualatex target
if 'lua' in TARGETS:
    os.system("latexmk -pdflua -output-directory=build/lualatex " +
              TEXFLAGS + " main.tex")
    os.system('mkdir -p build/pdfs')
    os.system("cp -v build/lualatex/main.pdf build/pdfs/lualatex.pdf")

# Clean compilation files
if 'clean' in TARGETS:
    os.system('rm -rfv build')
    os.system('mkdir -pv build/pdfs')

# Make release
if 'make-release' in TARGETS:
    VERSION = ARGUMENTS.get('version', '')
    if not re.match('^[0-9]+\.[0-9]+\.[0-9]+$', VERSION):
        print("Please specify release version number in version=X.X.X format!")
        Exit(1)

    print('version = ' + VERSION)
    RELEASE_DIR = 'build/releases/WUT-Thesis-' + VERSION

    os.system('mkdir -p ' + RELEASE_DIR + '/src')
    os.system('mkdir -p ' + RELEASE_DIR + '/tex')
    os.system('cp -r src/* ' + RELEASE_DIR + '/src')
    os.system('cp -r tex/* ' + RELEASE_DIR + '/tex')
    os.system('cp *.bib *.tex ' + RELEASE_DIR)
    os.system('cp SConstruct ' + RELEASE_DIR)

    os.system('zip -r ' + RELEASE_DIR + '.zip ' + RELEASE_DIR)

# Generate comparable txt from pdf
def make_cmp(PDF_FILE, CMP_FILE):
    os.system('pdftotext -enc UTF-8 ' + PDF_FILE + ' ' + CMP_FILE)
    os.system('cat ' + CMP_FILE +
                ' | tr -cd "[a-ząćęłńóśżźA-ZĄĆĘŁŃÓŚŻŹ]" > ' + CMP_FILE + '.2')
    os.system('mv ' + CMP_FILE + '.2' + ' ' + CMP_FILE)

# Make referentials
if 'make-referentials' in TARGETS:
    for file in os.listdir('build/pdfs'):
        PDF_FILE = 'build/pdfs/' + file
        REF_FILE = 'test/' + file + '_ref.txt'
        make_cmp(PDF_FILE, REF_FILE)

# Verify build
if 'verify-build' in TARGETS:
    for file in os.listdir('build/pdfs'):
        PDF_FILE = 'build/pdfs/' + file
        TXT_FILE = 'test/' + file + '.txt'
        REF_FILE = 'test/' + file + '_ref.txt'
        make_cmp(PDF_FILE, TXT_FILE)
        if filecmp.cmp(TXT_FILE, REF_FILE):
            os.system('rm ' + TXT_FILE)
        else:
            os.system('cmp ' + TXT_FILE + ' ' + REF_FILE)
            os.system('cat ' + TXT_FILE)
            Exit(1)

Exit(0)
