FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

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

RUN rm -rf ./pdfs/* && make all

ENTRYPOINT mkdir -p /dist/ubuntu && cp ./pdfs/* /dist/ubuntu
