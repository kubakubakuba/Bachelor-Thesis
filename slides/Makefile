SRC = main
BIB = ../main.bib
EXAMPLES = $(wildcard ../docs/fig/*.png)
EXAMPLES += $(wildcard ../docs/fig/*.jpg)
EXAMPLES += $(wildcard ../docs/fig/*.pdf)
EXAMPLES += $(wildcard ../*.py)
EXAMPLES += $(wildcard ../*.ipynb)

default: $(SRC).pdf

%.pdf: %.tex $(EXAMPLES) $(BIB)
	latexmk -pdf -pdflatex="pdflatex -shell-escape" -use-make $<
	latexmk -c
	rm -r _minted-$(basename $<) || true

clean:
	rm -f $(SRC).pdf $(SRC).aux $(SRC).log $(SRC).bbl $(SRC).blg $(SRC).nav $(SRC).out $(SRC).snm $(SRC).toc $(SRC).bcf $(SRC).run.xml $(SRC).run.xml