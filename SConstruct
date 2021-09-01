# *************************
# WUT-Thesis build targets
# *************************

import filecmp, os, re
from threading import Thread

TARGETS = COMMAND_LINE_TARGETS
TEXFLAGS = '-synctex=1 --interaction=nonstopmode'

# --------------
# Build targets
# --------------

# Pdflatex
def target_pdf():
    os.system("latexmk -pdf -output-directory=build/pdflatex " +
              TEXFLAGS + " main.tex")
    os.system('mkdir -p build/pdfs')
    os.system("cp -v build/pdflatex/main.pdf build/pdfs/pdflatex.pdf")

# Lualatex
def target_lua():
    os.system("latexmk -pdflua -output-directory=build/lualatex " +
              TEXFLAGS + " main.tex")
    os.system('mkdir -p build/pdfs')
    os.system("cp -v build/lualatex/main.pdf build/pdfs/lualatex.pdf")

# Clean
def target_clean():
    os.system('rm -rfv build/pdflatex')
    os.system('rm -rfv build/lualatex')
    os.system('rm -rfv build/pdfs')
    os.system('mkdir -pv build/pdfs')

# Make release-ready zip archive
def target_zip(VERSION):
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

# -------------
# Test targets
# -------------

# Generate txt from pdf
def make_txt(PDF_FILE, TXT_FILE):
    os.system('pdftotext -enc UTF-8 ' + PDF_FILE + ' ' + TXT_FILE)
    os.system('cat ' + TXT_FILE +
              ' | tr -cd "[a-zA-Z]" > ' + TXT_FILE + '.2')
    os.system('mv ' + TXT_FILE + '.2' + ' ' + TXT_FILE)

# Generate referential txt from .textest file
# Generated with both pdftex and luatex
def make_ref(TEXTEST_DIR):
    TEX_FILE = TEXTEST_DIR + '/main.textest'
    PDF_FILE = 'build/pdfs/pdflatex.pdf'
    LUA_FILE = 'build/pdfs/lualatex.pdf'
    REF_PDF = TEXTEST_DIR + '/pdflatex.txt'
    REF_LUA = TEXTEST_DIR + '/lualatex.txt'

    target_clean()
    os.system('cp -f main.tex test/default.textest')
    os.system('cp -f ' + TEX_FILE + ' main.tex')

    target_pdf()
    target_lua()
    os.system('cp ' + PDF_FILE + ' ' + TEXTEST_DIR)
    os.system('cp ' + LUA_FILE + ' ' + TEXTEST_DIR)
    make_txt(PDF_FILE, REF_PDF)
    make_txt(LUA_FILE, REF_LUA)

    os.system('mv -f test/default.textest main.tex')
    target_clean()

# Compare pdf with specified ref file
def test_pdf(PDF_FILE, REF_FILE):
    PDF_TXT = PDF_FILE + '.txt'
    make_txt(PDF_FILE, PDF_TXT)
    if filecmp.cmp(PDF_TXT, REF_FILE):
        print(os.path.basename(PDF_FILE) + ": OK")
        os.system('rm ' + PDF_TXT)
    else:
        os.system('cat ' + PDF_TXT)
        os.system('cmp ' + PDF_TXT + ' ' + REF_FILE)
        print(os.path.basename(PDF_FILE) + ": test failed")
        os.system('rm ' + PDF_TXT)
        Exit(1)

# Make referential files for all defined test cases
# Use local machine environment
def target_local_refs():
    make_ref('test/en/eiti')
    make_ref('test/en/meil')
    make_ref('test/pl/eiti')
    make_ref('test/pl/meil')

# Make referential files for all defined test cases
# using ubuntu:latest docker image
def target_docker_refs():
    os.system('docker build -f test/Dockerfile -t wut .')
    os.system('docker run --mount type=bind,source=$(pwd)/test,target=/ext -t wut')

# Test luatex and pdftex pdfs with specified ref
def target_test(REF_DIR):
    target_pdf()
    target_lua()
    print("")
    test_pdf('build/pdfs/pdflatex.pdf', REF_DIR + '/pdflatex.txt')
    test_pdf('build/pdfs/lualatex.pdf', REF_DIR + '/lualatex.txt')

# --------------------------
# Process specified targets
# --------------------------

if not TARGETS:
    print("Available targets: all clean docker lua pdf test zip")
    Exit(1)

for target in TARGETS:
    if target == 'all':
        target_pdf()
        target_lua()
    elif target == 'pdf':
        target_pdf()
    elif target == 'lua':
        target_lua()
    elif target == 'clean':
        target_clean()
    elif target == 'zip':
        target_zip(ARGUMENTS.get('version', ''))
    elif target =='make-refs':
        target_local_refs()
    elif target == 'docker':
        target_docker_refs()
    elif target == 'test':
        target_test(ARGUMENTS.get('ref', 'test/pl/eiti'))
    else:
        print(target + ': unknown target')
        Exit(1)

Exit(0)
