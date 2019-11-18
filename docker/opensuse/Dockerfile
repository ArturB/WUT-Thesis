FROM opensuse/leap:latest

RUN apt-get install -y make \
                       latexmk \
                       tex-gyre \
                       texlive-bibtex-extra \
                       texlive-fonts-extra \
                       texlive-lang-polish \
                       texlive-latex-extra \
                       texlive-luatex \
                       texlive-xetex

COPY . /wut-thesis

WORKDIR /wut-thesis

RUN rm -f ./pdfs/* && make all

ENTRYPOINT cp ./pdfs/* /dist
