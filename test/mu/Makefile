.PHONY: all implode
TARGETS=expected-econ-lualatex.pdf expected-fss-pdflatex.pdf \
	expected-phil-lualatex.pdf expected-econ-pdflatex.pdf \
	expected-law-lualatex.pdf expected-phil-pdflatex.pdf \
	expected-fi-lualatex.pdf expected-law-pdflatex.pdf \
	expected-sci-lualatex.pdf expected-fi-pdflatex.pdf \
	expected-med-lualatex.pdf expected-sci-pdflatex.pdf \
	expected-fsps-lualatex.pdf expected-med-pdflatex.pdf \
	expected-fsps-pdflatex.pdf expected-ped-lualatex.pdf \
	expected-fss-lualatex.pdf expected-ped-pdflatex.pdf
EXAMPLEDIR=../../example/mu

# This target runs all the tests.
all:
	make -C $(EXAMPLEDIR) implode
	make -C $(EXAMPLEDIR) all
	make $(TARGETS)

# This target runs a single test.
expected-%.pdf: $(EXAMPLEDIR)/%.pdf
	../comparepdf.sh $< $@ || \
	{ [ "$(UPDATE_FAILED)" = true ] && mv $< $@; }

# This is a dummy target.
implode:
	
