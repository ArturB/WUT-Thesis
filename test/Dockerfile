FROM ubuntu:latest

# Set timezone
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install LaTeX and SCons
RUN apt-get update
RUN apt-get install -y \
            biber \
            latexmk \
            poppler-utils \
            scons \
            texlive \
            texlive-bibtex-extra \
            texlive-fonts-extra \
            texlive-latex-extra \
            texlive-lang-polish \
            texlive-luatex \
            tex-gyre

# Copy WUT-Thesis source code
COPY . /

# Build and copy refs
ENTRYPOINT [ "/bin/bash", "-c", "scons make-refs && cp -rv /test/* /ext" ]
