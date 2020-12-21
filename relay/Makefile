latex_files := $(wildcard *.tex appendices/*.tex)
main_latex_file := layer2.tex
references := references.bib

.PHONY: pdf

pdf: $(main_latex_file) $(latex_files) $(references)
	latexmk -pdf -halt-on-error $<
