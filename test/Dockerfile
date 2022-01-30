FROM ubuntu:latest

# Set timezone
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install LaTeX dependencies
RUN apt-get update
RUN apt-get install -y \
            biber \
            latexmk \
            python3-pip \
            texlive \
            texlive-bibtex-extra \
            texlive-fonts-extra \
            texlive-latex-extra \
            texlive-lang-polish \
            texlive-luatex \
            tex-gyre

# Copy WUT-Thesis source code
COPY . /

# Install Python dependencies
RUN pip install -r requirements.txt

# Build and copy referential txt
ENTRYPOINT [ "/bin/bash", "-c", "scons clean && scons update_refs_local && cp -rv /test/* /ext" ]
