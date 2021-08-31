# *************************
# WUT-Thesis build targets
# *************************

import filecmp, os, re

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
def make_cmp(PDF_FILE, CMP_FILE):
    os.system('pdftotext -enc UTF-8 ' + PDF_FILE + ' ' + CMP_FILE)
    os.system('cat ' + CMP_FILE +
              ' | tr -cd "[a-zA-Z]" > ' + CMP_FILE + '.2')
    os.system('mv ' + CMP_FILE + '.2' + ' ' + CMP_FILE)

# Generate referential txt from .textest file
def make_ref(TEXTEST_DIR):
    PDF_FILE = 'build/pdfs/pdflatex.pdf'
    REF_FILE = TEXTEST_DIR + '/ref.txt'
    TEST_FILE = TEXTEST_DIR + '/main.textest'

    target_clean()
    os.system('cp -f main.tex test/default.textest')

    os.system('cp -f ' + TEST_FILE + ' main.tex')
    target_pdf()
    os.system('cp ' + PDF_FILE + ' ' + TEXTEST_DIR + '/ref.pdf')
    make_cmp(PDF_FILE, REF_FILE)

    os.system('mv -f test/default.textest main.tex')
    target_clean()

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

# Compare pdf with specified ref file
def target_test(PDF_FILE, REF_FILE):
    TXT_FILE = PDF_FILE + '.txt'
    make_cmp(PDF_FILE, TXT_FILE)
    if filecmp.cmp(TXT_FILE, REF_FILE):
        print("\nTest result: OK")
        os.system('rm ' + TXT_FILE)
    else:
        os.system('cmp ' + TXT_FILE + ' ' + REF_FILE)
        os.system('cat ' + TXT_FILE)
        print("\n\nTest result: failed")
        os.system('rm ' + TXT_FILE)
        Exit(1)

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
    if target == 'pdf':
        target_pdf()
    elif target == 'lua':
        target_lua()
    elif target == 'clean':
        target_clean()
    elif target == 'zip':
        target_zip(ARGUMENTS.get('version', ''))
    elif target == 'docker':
        target_docker_refs()
    elif target =='make-refs':
        target_local_refs()
    elif target == 'test':
        REF_FILE = ARGUMENTS.get('ref', 'test/pl/eiti/ref.txt')
        target_pdf()
        target_test('build/pdfs/pdflatex.pdf', REF_FILE)
    else:
        print(target + ': unknown target')
        Exit(1)

Exit(0)
