.PHONY: specs clean clean-all

specs:
	latexmk -pdf

clean:
	latexmk -c

clean-all:
	latexmk -C
