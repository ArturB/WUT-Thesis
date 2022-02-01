# ----------------------
# WUT-Thesis build spec
# ----------------------

import filecmp, os, shutil, subprocess
from jinja2 import Environment, FileSystemLoader
from pathlib import Path
from pdfminer.high_level import extract_text
from SCons.Script import ARGUMENTS, COMMAND_LINE_TARGETS
from SCons.Script.SConscript import SConsEnvironment

# --------------
# Build targets
# --------------

LATEXMK_BASE = ["latexmk", "-synctex=1", "--interaction=nonstopmode"]

# Build tex file using pdflatex
def target_pdf(tex_file: Path, pdf_file: Path):
    LATEXMK = LATEXMK_BASE
    LATEXMK += ["-pdf"]
    LATEXMK += ["--output-directory=" + str(Path("build/pdflatex"))]
    LATEXMK += [str(tex_file)]
    subprocess.run(LATEXMK)
    intermediate_pdf = tex_file.with_suffix(".pdf").name
    if not pdf_file.parent.exists():
        os.makedirs(pdf_file.parent)
    shutil.copy(Path("build/pdflatex/" + intermediate_pdf), pdf_file)


# Build tex file using lualatex
def target_lua(tex_file: Path, pdf_file: Path):
    LATEXMK = LATEXMK_BASE
    LATEXMK += ["-pdflua"]
    LATEXMK += ["--output-directory=" + str(Path("build/lualatex"))]
    LATEXMK += [str(tex_file)]
    subprocess.run(LATEXMK)
    intermediate_pdf = tex_file.with_suffix(".pdf").name
    if not pdf_file.parent.exists():
        os.makedirs(pdf_file.parent)
    shutil.copy(Path("build/lualatex/" + intermediate_pdf), pdf_file)


# Clean build files
def target_clean():
    shutil.rmtree("build")
    os.makedirs("build/pdfs")


# -------------
# Test targets
# -------------

# fmt:off
TEST_CASES = [
    {"lang": "pol", "faculty": "eiti", "thesis": "EngineerThesis"},
    {"lang": "pol", "faculty": "eiti", "thesis": "MasterThesis"},
    {"lang": "pol", "faculty": "meil", "thesis": "EngineerThesis"},
    {"lang": "pol", "faculty": "meil", "thesis": "MasterThesis"},
    {"lang": "eng", "faculty": "eiti", "thesis": "EngineerThesis"},
    {"lang": "eng", "faculty": "eiti", "thesis": "MasterThesis"},
    {"lang": "eng", "faculty": "meil", "thesis": "EngineerThesis"},
    {"lang": "eng", "faculty": "meil", "thesis": "MasterThesis"},
]
# fmt:on

# Generate txt from pdf
def pdf_to_txt(pdf_file: Path, txt_file: Path):
    with open(txt_file, "w") as txt_handler:
        text = extract_text(pdf_file)
        text2 = ""
        for char in text:
            if char in "abcdefghijklmnoprstuvwxyzABCDEFGHIJKLMNOPRSTUVWXYZ":
                text2 += char
        txt_handler.write(text2)


# Generate textest files (test cases)
# from ./test/main.tex.j2 Jinja template
def generate_tests():
    env = Environment(
        loader=FileSystemLoader(searchpath=Path("test")),
        variable_start_string="__[",
        variable_end_string="]__",
    )
    template = env.get_template("main.tex.j2")
    for test_case in TEST_CASES:
        textest_path = Path(
            "test/"
            + test_case["lang"]
            + "/"
            + test_case["faculty"]
            + "/"
            + test_case["thesis"]
            + ".textest"
        )
        with open(textest_path, "w") as textest_handler:
            textest_handler.write(template.render(test_case))
    print(str(len(TEST_CASES)) + " test cases generated")


# Update referential txt's from current textest files
# Use local machine environment
def update_refs_local():
    for test_case in TEST_CASES:
        # fmt:off
        tex_file = Path(
            "test/" + test_case["lang"]
            + "/" + test_case["faculty"]
            + "/" + test_case["thesis"]
            + ".textest"
        )
        pdf_file = Path(
            "test/" + test_case["lang"]
            + "/" + test_case["faculty"]
            + "/" + test_case["thesis"]
            + "_pdflatex.pdf"
        )
        lua_file = Path(
            "test/" + test_case["lang"]
            + "/" + test_case["faculty"]
            + "/" + test_case["thesis"]
            + "_lualatex.pdf"
        )
        # fmt:on
        target_pdf(tex_file, pdf_file)
        pdf_to_txt(pdf_file, pdf_file.with_suffix(".txt"))

        target_lua(tex_file, lua_file)
        pdf_to_txt(lua_file, lua_file.with_suffix(".txt"))


# Update referential txt's from current textest files
# Use ubuntu:latest docker environment
def update_refs_docker():
    subprocess.run(
        ["docker", "build", "-f", str(Path("test/Dockerfile")), "-t", "wut", "."]
    )
    subprocess.run(
        [
            "docker",
            "run",
            "--mount",
            "type=bind,source=" + str(Path.cwd()) + "/test,target=/ext",
            "-t",
            "wut",
        ]
    )


# Compare pdf with specified
# referential txt
def test_pdf(pdf_file: Path, ref_file: Path):
    pdf_file_txt = pdf_file.with_suffix(".txt")
    pdf_to_txt(pdf_file, pdf_file_txt)
    if filecmp.cmp(pdf_file_txt, ref_file):
        print(str(pdf_file) + ": OK")
        os.remove(pdf_file_txt)
    else:
        print(str(pdf_file) + ": test failed!")
        os.remove(pdf_file_txt)
        SConsEnvironment.Exit(1)


# --------------------------
# Process specified targets
# --------------------------

# Auxiliary
def print_help():
    print("Available targets: ")
    print("    quick all pdf lua clean generate_tests test_pdf")
    print("    update_refs_local update_refs_docker")


if not COMMAND_LINE_TARGETS:
    print_help()
    SConsEnvironment.Exit(1)

for target in COMMAND_LINE_TARGETS:
    if target == "quick":
        target_pdf(Path("main.tex"), Path("main.pdf"))
    elif target == "all":
        target_pdf(Path("main.tex"), Path("build/pdfs/pdflatex.pdf"))
        target_lua(Path("main.tex"), Path("build/pdfs/lualatex.pdf"))
    elif target == "pdf":
        target_pdf(Path("main.tex"), Path("build/pdfs/pdflatex.pdf"))
    elif target == "lua":
        target_lua(Path("main.tex"), Path("build/pdfs/lualatex.pdf"))
    elif target == "clean":
        target_clean()
    elif target == "generate_tests":
        generate_tests()
    elif target == "update_refs_local":
        generate_tests()
        update_refs_local()
    elif target == "update_refs_docker":
        generate_tests()
        update_refs_docker()
    elif target == "test_pdf":
        test_pdf(
            Path(ARGUMENTS.get("pdf", "build/pdfs/pdflatex.pdf")),
            Path(ARGUMENTS.get("ref", "test/pol/eiti/EngineerThesis_pdflatex.txt")),
        )
    else:
        print(target + ": unknown target")
        print_help()
        SConsEnvironment.Exit(1)

SConsEnvironment.Exit(0)
