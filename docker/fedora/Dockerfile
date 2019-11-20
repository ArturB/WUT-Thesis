FROM fedora:latest

RUN dnf install -y make \
                   latexmk \
                   texlive-collection-bibtexextra \
                   texlive-collection-fontsextra \
                   texlive-collection-langpolish \
                   texlive-collection-latexextra \
                   texlive-collection-luatex

COPY ./*.tex     /wut-thesis/
COPY ./*.bib     /wut-thesis/
COPY ./Makefile  /wut-thesis/
COPY ./eiti/*    /wut-thesis/eiti/
COPY ./img/*     /wut-thesis/img/
COPY ./scripts/* /wut-thesis/scripts/
COPY ./tex/*     /wut-thesis/tex/

WORKDIR /wut-thesis

RUN rm -rf ./pdfs/* && make all

ENTRYPOINT mkdir -p /dist/fedora && cp ./pdfs/* /dist/fedora
