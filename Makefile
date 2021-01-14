latex_files := $(wildcard *.tex chapters/*.tex config/*.tex appendices/*.tex)
main_latex_file := zeth-protocol-specification.tex
references := references.bib

.PHONY: specs clean clean-all

specs: $(main_latex_file) $(latex_files) $(references)
	latexmk -pdf

clean:
	latexmk -c

clean-all:
	latexmk -C
