FROM ubuntu:20.04

RUN apt-get update

# https://github.com/moby/moby/issues/4032
# ARG DEBIAN_FRONTEND=noninteractive
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
    texlive \
    texlive-science \
    texlive-fonts-extra \
    texlive-plain-generic \
    texlive-bibtex-extra \
    biber \
    latexmk \
    perl \
    make

# To develop inside of the container, you will need to install
# your desired text editor after launching the container, else
# add a line here and rebuild the image.
# e.g.
# RUN apt-get install -y vi

WORKDIR /zeth-specs
COPY . .

CMD ["/bin/bash"]
