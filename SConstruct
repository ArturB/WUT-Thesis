# *************************
# WUT-Thesis build targets
# *************************

import filecmp, os, re, platform
from SCons.Script import ARGUMENTS, COMMAND_LINE_TARGETS
from SCons.Script.SConscript import SConsEnvironment

TEXFLAGS = "-synctex=1 --interaction=nonstopmode"

# --------------
# Build targets
# --------------

# Pdflatex
def target_pdf():
    if platform.system() == 'Linux':
        os.system("latexmk -pdf -output-directory=build/pdflatex " + TEXFLAGS + " main.tex")
    elif platform.system() == 'Windows':
        os.system("latexmk -pdf -output-directory=build\\pdflatex " + TEXFLAGS + " main.tex")
    target_paste_to_pdfs("pdflatex")


# Lualatex
def target_lua():
    if platform.system() == 'Linux':
        os.system("latexmk -pdflua -output-directory=build/lualatex " + TEXFLAGS + " main.tex")
    elif platform.system() == 'Windows':
        os.system("latexmk -pdflua -output-directory=build\\lualatex " + TEXFLAGS + " main.tex")
    target_paste_to_pdfs("lualatex")

def target_paste_to_pdfs(kind):
    if platform.system() == 'Linux':
        os.system("mkdir -p build/pdfs")
        os.system("cp -v build/" + kind + "/main.pdf build/pdfs/" + kind + ".pdf")
    elif platform.system() == 'Windows':
        os.system("if not exist build\\pdfs mkdir build\\pdfs")
        os.system("copy build\\" + kind + "\\main.pdf build\\pdfs\\" + kind + ".pdf")

# Clean
def target_clean():
    if platform.system() == 'Linux':
        os.system("rm -rfv build/pdflatex")
        os.system("rm -rfv build/lualatex")
        os.system("mkdir -pv build/pdfs")
    elif platform.system() == 'Windows':
        os.system("if exist build\\pdflatex rd /S /Q build\\pdflatex")
        os.system("if exist build\\lualatex rd /S /Q build\\lualatex")
        os.system("if not exist build\\pdfs mkdir build\\pdfs")


# Make release-ready zip archive
def target_zip(VERSION):
    if not re.match("^[0-9]+\.[0-9]+\.[0-9]+$", VERSION):
        print("Please specify release version number in version=X.X.X format!")
        SConsEnvironment.Exit(1)

    print("version = " + VERSION)
    if platform.system() == 'Linux':
        RELEASE_DIR = "build/releases/WUT-Thesis-" + VERSION
    elif platform.system() == 'Windows':
        RELEASE_DIR = "build\\releases\\WUT-Thesis-" + VERSION

    if platform.system() == 'Linux':
        os.system("mkdir -p " + RELEASE_DIR + "/src")
        os.system("mkdir -p " + RELEASE_DIR + "/tex")
        os.system("cp -r src/* " + RELEASE_DIR + "/src")
        os.system("cp -r tex/* " + RELEASE_DIR + "/tex")
        os.system("cp *.bib *.tex " + RELEASE_DIR)
        os.system("cp SConstruct " + RELEASE_DIR)
    elif platform.system() == 'Windows':
        os.system("if not exist " + RELEASE_DIR + "\\src mkdir " + RELEASE_DIR + "\\src")
        os.system("if not exist " + RELEASE_DIR + "\\tex mkdir " + RELEASE_DIR + "\\tex")
        os.system("xcopy /S /Y src\\* " + RELEASE_DIR + "\\src /E /H")
        os.system("xcopy /S /Y tex\\* " + RELEASE_DIR + "\\tex /E /H")
        os.system("copy *.bib *.tex " + RELEASE_DIR)
        os.system("copy SConstruct " + RELEASE_DIR)

    if platform.system() == 'Linux':
        os.system("zip -r " + RELEASE_DIR + ".zip " + RELEASE_DIR)
    elif platform.system() == 'Windows':
        os.system("powershell \"Compress-Archive '" + RELEASE_DIR + "' '" + RELEASE_DIR +".zip'\"")


# -------------
# Test targets
# -------------

# Generate txt from pdf
def make_txt(PDF_FILE, TXT_FILE):
    os.system("pdftotext -enc UTF-8 " + PDF_FILE + " " + TXT_FILE)
    if platform.system() == 'Linux':
        os.system("cat " + TXT_FILE + ' | tr -cd "[a-zA-Z]" > ' + TXT_FILE + ".2")
        os.system("mv " + TXT_FILE + ".2" + " " + TXT_FILE)
    elif platform.system() == 'Windows':
        os.system('powershell "(Get-Content ' + TXT_FILE + ' -Encoding UTF8 | Out-String) -replace \\"[^^a-zA-Z]\\",\\"\\"  > ' + TXT_FILE + '.2"')
        os.system("move /Y " + TXT_FILE + ".2" + " " + TXT_FILE)


# Generate referential txt from .textest file
# Generated with both pdftex and luatex
def make_ref(TEXTEST_DIR):
    if platform.system() == 'Linux':
        TEX_FILE = TEXTEST_DIR + "/main.textest"
        PDF_FILE = "build/pdfs/pdflatex.pdf"
        LUA_FILE = "build/pdfs/lualatex.pdf"
        REF_PDF = TEXTEST_DIR + "/pdflatex.txt"
        REF_LUA = TEXTEST_DIR + "/lualatex.txt"

        target_clean()
        os.system("cp -f main.tex test/default.textest")
        os.system("cp -f " + TEX_FILE + " main.tex")

        target_pdf()
        target_lua()
        os.system("cp " + PDF_FILE + " " + TEXTEST_DIR)
        os.system("cp " + LUA_FILE + " " + TEXTEST_DIR)
        make_txt(PDF_FILE, REF_PDF)
        make_txt(LUA_FILE, REF_LUA)

        os.system("mv -f test/default.textest main.tex")
        target_clean()
    elif platform.system() == 'Windows':
        TEX_FILE = TEXTEST_DIR + "\\main.textest"
        PDF_FILE = "build\\pdfs\\pdflatex.pdf"
        LUA_FILE = "build\\pdfs\\lualatex.pdf"
        REF_PDF = TEXTEST_DIR + "\\pdflatex.txt"
        REF_LUA = TEXTEST_DIR + "\\lualatex.txt"

        target_clean()
        os.system("copy /Y main.tex test\\default.textest")
        os.system("copy /Y" + TEX_FILE + " main.tex")

        target_pdf()
        target_lua()
        os.system("copy " + PDF_FILE + " " + TEXTEST_DIR)
        os.system("copy " + LUA_FILE + " " + TEXTEST_DIR)
        make_txt(PDF_FILE, REF_PDF)
        make_txt(LUA_FILE, REF_LUA)

        os.system("move /Y test\\default.textest main.tex")
        target_clean()


# Compare pdf with specified ref file
def test_pdf(PDF_FILE, REF_FILE):
    PDF_TXT = PDF_FILE + ".txt"
    make_txt(PDF_FILE, PDF_TXT)
    if filecmp.cmp(PDF_TXT, REF_FILE):
        print(os.path.basename(PDF_FILE) + ": OK")
        if platform.system() == 'Linux':
            os.system("rm " + PDF_TXT)
        elif platform.system() == 'Windows':
            os.system("del " + PDF_TXT)
    else:
        if platform.system() == 'Linux':
            os.system("cat " + PDF_TXT)
            os.system("cmp " + PDF_TXT + " " + REF_FILE)
            print(os.path.basename(PDF_FILE) + ": test failed")
            os.system("rm " + PDF_TXT)
        elif platform.system() == 'Windows':
            os.system("powershell \"Get-Content " + PDF_TXT + "\"")
            os.system("comp /M " + PDF_TXT + " " + REF_FILE)
            print(os.path.basename(PDF_FILE) + ": test failed")
            os.system("del " + PDF_TXT)
        SConsEnvironment.Exit(1)


# Make referential files for all defined test cases
# Use local machine environment
# Use inside docker container only
def target_local_refs():
    if os.path.isfile("/.dockerenv"):
        if platform.system() == 'Linux':
            make_ref("test/en/eiti")
            make_ref("test/en/meil")
            make_ref("test/pl/eiti")
            make_ref("test/pl/meil")
        elif platform.system() == 'Windows':
            make_ref("test\\en\\eiti")
            make_ref("test\\en\\meil")
            make_ref("test\\pl\\eiti")
            make_ref("test\\pl\\meil")
    else:
        print("Use this target in docker container only!")
        SConsEnvironment.Exit(1)


# Make referential files for all defined test cases
# using ubuntu:latest docker image
def target_docker_refs():
    if platform.system() == 'Linux':
        os.system("docker build -f test/Dockerfile -t wut .")
        os.system("docker run --mount type=bind,source=$(pwd)/test,target=/ext -t wut")
    elif platform.system() == 'Windows':
        os.system("docker build -f test\\Dockerfile -t wut .")
        os.system("docker run --mount type=bind,source=%CD%\\test,target=/ext -t wut")


# Test luatex and pdftex pdfs with specified ref
def target_test(REF_DIR):
    target_pdf()
    target_lua()
    print("")
    if platform.system() == 'Linux':
        test_pdf("build/pdfs/pdflatex.pdf", REF_DIR + "/pdflatex.txt")
        test_pdf("build/pdfs/lualatex.pdf", REF_DIR + "/lualatex.txt")
    elif platform.system() == 'Windows':
        test_pdf("build\\pdfs\\pdflatex.pdf", REF_DIR + "\\pdflatex.txt")
        test_pdf("build\\pdfs\\lualatex.pdf", REF_DIR + "\\lualatex.txt")


# --------------------------
# Process specified targets
# --------------------------
if not COMMAND_LINE_TARGETS:
    print("Available targets: all clean docker lua pdf test zip")
    SConsEnvironment.Exit(1)

for target in COMMAND_LINE_TARGETS:
    if target == "all":
        target_pdf()
        target_lua()
    elif target == "pdf":
        target_pdf()
    elif target == "lua":
        target_lua()
    elif target == "clean":
        target_clean()
    elif target == "zip":
        target_zip(ARGUMENTS.get("version", ""))
    elif target == "make-refs":
        target_local_refs()
    elif target == "docker":
        target_docker_refs()
    elif target == "test":
        if platform.system() == 'Linux':
            target_test(ARGUMENTS.get("ref", "test/pl/eiti"))
        elif platform.system() == 'Windows':
            target_test(ARGUMENTS.get("ref", "test\\pl\\eiti"))
    else:
        print(target + ": unknown target")
        SConsEnvironment.Exit(1)

SConsEnvironment.Exit(0)
