BUILD_DIR := build

TEX_TPL   := template.tex.tpl
PGF_SRCS  := $(wildcard *.pgf)

PGF_BLD   := $(patsubst %.pgf,$(BUILD_DIR)/%.pgf,$(PGF_SRCS))
TEX_BLD   := $(patsubst %.pgf,$(BUILD_DIR)/%.tex,$(PGF_SRCS))
PDF_BLD   := $(patsubst %.pgf,$(BUILD_DIR)/%.pdf,$(PGF_SRCS))

all: $(PDF_BLD)

$(BUILD_DIR)/%.pgf: %.pgf
	mkdir -p $(BUILD_DIR)
	sed -E 's/\\fontsize\{[0-9.]+\}\{[0-9.]+\}\\selectfont//g' \
		$< > $@

$(BUILD_DIR)/%.tex: $(BUILD_DIR)/%.pgf $(TEX_TPL)
	sed 's#__TEMPLATE__#'"$(notdir $*)".pgf'#g' \
		$(TEX_TPL) > $@

$(BUILD_DIR)/%.pdf: $(BUILD_DIR)/%.tex
	pdflatex -shell-escape \
			  -output-directory=$(BUILD_DIR) \
			  -interaction=nonstopmode -halt-on-error \
			  $<

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
