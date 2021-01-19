.PHONY: specs clean clean-all

specs:
	latexmk -pdf -halt-on-error

clean:
	latexmk -c

clean-all:
	latexmk -C
