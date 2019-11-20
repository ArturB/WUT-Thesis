FROM opensuse/leap:latest

RUN zypper install -y make \
                      latexmk \
                      tex-gyre \
                      texlive-bibtex-extra \
                      texlive-fonts-extra \
                      texlive-lang-polish \
                      texlive-latex-extra \
                      texlive-luatex \
                      texlive-xetex

WORKDIR /wut-thesis

RUN rm -rf ./pdfs/* && make all

ENTRYPOINT mkdir -p /dist/opensuse && cp ./pdfs/* /dist/opensuse
