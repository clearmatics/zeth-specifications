# Zeth Protocol specifications

This repository contains:
- the source code of the Zeth protocol specifications
- the source code of the Zeth transaction relay document (see [here](relay)).

## Motivations

These specification documents are the interface between Zeth protocol researchers/designers and implementers.

The motivation for such work is very well summarized in "Lessons Learned in Implementing and Deploying Crypto Software" by Peter Gutmann, an excerpt of which is quoted below:

> Most crypto software is written with the assumption that the user knows what they're doing, and will choose the most appropriate algorithm and mode of operation, carefully manage key generation and secure key storage, employ the crypto in a suitably safe manner, and do a great many other things that require fairly detailed crypto knowledge.
> However, since most implementers are everyday programmers whose motivation for working with crypto is defined by "the boss said do it", the inevitable result is the creation of products with genuine naugahyde crypto.

As Schneier says "the weak points had nothing to do with mathematics [...] Beautiful pieces of mathematics were made irrelevant through bad programming".

These specification documents aim to document the protocols' design decisions as well as provide implementation guidelines/pitfalls to avoid, to implementers of the protocols.

## Dependencies

On Debian-type systems, run:
```console
apt-get install -y -q \
    texlive \
    texlive-science \
    texlive-fonts-extra \
    texlive-plain-generic \
    texlive-bibtex-extra \
    biber \
    latexmk \
    perl \
    make
```

On macOS, run:
```console
brew install --cask mactex
# If latexmk is not available, install it by running: tlmgr install latexmk
```

To compile and edit the document from a configured docker container, run:
```console
docker build -t zeth-specs-dev -f Dockerfile .
docker run -ti zeth-specs-dev
# To move the .pdf on the host after compilation, you can use `docker cp`
```

## Instructions to compile the Zeth protocol document

To compile the document, copy and paste the following command in your terminal:

```bash
make
```

To remove all intermediate/compilation files, run:
```bash
make clean
```

To remove all intermediate/compilation files **and** the compiled `.pdf` files, run:
```bash
make clean-all
```

## Organization and conventions

### File names

- Every chapter is written in a document called `chapXX-base.tex`, where `XX` is the chapter number as documented in the table of content. The chapter files should be located in the [chapters](./chapters) folder.
- Every section is written in a separate document, and included in the corresponding chapter file. The section files are named: `chapXX-secYY.tex`, where `XX` is the chapter number as documented in the table of content, and where `YY` is the section number as documented in the table of content. The section files should be created in the [chapters](./chapters) folder.

### Labels and references

Use labels and references to link ideas throughout the document. Everytime an environment is opened (i.e. chapter, section, subsection, equation, theorem and so on.), it should be assigned a label.

We list below the naming conventions for the labels:

- The label convention for chapters is `chap:<chapter-name>`
- The label convention for sections is `<chapter-name>:<section-name>`
- The label convention for subsections is `<chapter-name>:<section-name>:<subsection-name>`
- The label convention for subsubsections is `<chapter-name>:<section-name>:<subsection-name>:<subsubsection-name>`
- The label convention for figures is `<chapter-name>:fig:<figure-name>`
- The label convention for equations is `<chapter-name>:eq:<equation-name>`
- The label convention for theorems is `<chapter-name>:th:<theorem-name>`
- The label convention for definitions is `<chapter-name>:def:<definition-name>`

:warning: To prevent any edge case in naming, the following names are considered keywords and thus, cannot be used as `<chapter-name>, <section-name>, <subsection-name>, <subsubsection-name>, <definition-name>, <figure-name>, <equation-name>, <theorem-name>` and so on:
- `fig` (allocated to define a namespace for figures)
- `eq` (allocated to define a namespace for equations
- `th` (allocated to define a namespace for theorems)
- `def` (allocated to define a namespace for definitions)

### Template files

#### Chapter file

Defined in the [chapters](./chapters) folder.

```latex
%!Tex root = ../zeth-protocol-specification.tex

\chapter{Introduction}\label{chap:introduction}

% Assumes this chapter is the first one, so it's ID is 01
\input{chap01-sec01.tex} % Notations
\input{chap01-sec02.tex} % Background
...
\input{chap01-sec0N.tex} % <Name of the Nth section of the chapter>
```

#### Section file

Defined in the [chapters](./chapters) folder.

```latex
\section{Notations}\label{introduction:notations}

<BODY>

\subsection{Mysubsection}\label{introduction:notations:mysubsection}

<BODY>
```

*Note:* If the names of the chapters, sections, subsections and other environments become intractably too long, we can use a "compressed" form, as long as one makes sure to keep the naming meaningful and consistent. Do this responsibly.

E.g. `\label{introduction:notations}` can become `\label{intro:notations}`, which implies that `\label{introduction:notations:mysubsection}` becomes `\label{intro:notations:mysubsec}`.

----------------

Please refer to the [general latex document contribution guide](./contribute.md) for further notes.
