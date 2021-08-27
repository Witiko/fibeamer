.PHONY: all implode
TARGETS=expected-standard-lualatex.pdf expected-standard-pdflatex.pdf
EXAMPLEDIR=../../example/bs

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
	
