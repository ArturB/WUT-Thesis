FROM fedora:latest

RUN dnf install -y make \
                   latexmk \
                   texlive-collection-bibtexextra \
                   texlive-collection-fontsextra \
                   texlive-collection-langpolish \
                   texlive-collection-latexextra \
                   texlive-collection-luatex

COPY . /wut-thesis

WORKDIR /wut-thesis

RUN rm -f ./pdfs/* && make all

ENTRYPOINT mkdir -p /dist/fedora && cp ./pdfs/* /dist/fedora
