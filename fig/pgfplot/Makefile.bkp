LATEX = pdflatex
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

PGF_FILES := $(wildcard *.pgf)
TEX_FILES := $(PGF_FILES:.pgf=.tex)
PDF_FILES := $(PGF_FILES:.pgf=.pdf)

all: $(PDF_FILES)

%.pdf: %.tex %.pgf
	$(LATEX) $(LATEX_FLAGS) $<

%.tex: %.pgf template.tex.tpl
	cp template.tex.tpl $@
	sed -i 's/__TEMPLATE__/$</g' $@

clean:
	rm -f *.aux *.log *.out *.tex *.pdf

lclean:
	rm -f *.aux *.log *.out

.PHONY: all clean