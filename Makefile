SUBMAKES_REQUIRED=theme/mu logo/mu
SUBMAKES_MISCELLANEOUS=example/mu
SUBMAKES=$(SUBMAKES_REQUIRED) $(SUBMAKES_MISCELLANEOUS)
.PHONY: all complete clean dist dist-implode implode \
	install uninstall $(SUBMAKES)
BASETHEMEFILE=beamerthemefibeamer.sty
OTHERTHEMEFILES=theme/mu/*.sty
THEMEFILES=$(BASETHEMEFILE) $(OTHERTHEMEFILES)
LOGOSOURCES=logo/mu/*.svg
LOGOS=logo/mu/*.pdf logo/mu/*.eps
DTXFILES=*.dtx theme/mu/*.dtx
INSFILES=*.ins theme/mu/*.ins
MAKES=theme/mu/Makefile logo/mu/Makefile Makefile
USEREXAMPLES=example/mu/econ-lualatex.tex \
	example/mu/econ-pdflatex.tex example/mu/fi-lualatex.tex \
	example/mu/fi-pdflatex.tex example/mu/fsps-lualatex.tex \
	example/mu/fsps-pdflatex.tex  example/mu/fss-lualatex.tex \
	example/mu/fss-pdflatex.tex example/mu/law-lualatex.tex \
	example/mu/law-pdflatex.tex  example/mu/med-lualatex.tex \
	example/mu/med-pdflatex.tex example/mu/ped-lualatex.tex \
	example/mu/ped-pdflatex.tex  example/mu/phil-lualatex.tex \
	example/mu/phil-pdflatex.tex example/mu/sci-lualatex.tex \
	example/mu/sci-pdflatex.tex example/mu/econ-lualatex.pdf \
	example/mu/econ-pdflatex.pdf  example/mu/fi-lualatex.pdf \
	example/mu/fi-pdflatex.pdf example/mu/fsps-lualatex.pdf \
	example/mu/fsps-pdflatex.pdf  example/mu/fss-lualatex.pdf \
	example/mu/fss-pdflatex.pdf example/mu/law-lualatex.pdf \
	example/mu/law-pdflatex.pdf  example/mu/med-lualatex.pdf \
	example/mu/med-pdflatex.pdf example/mu/ped-lualatex.pdf \
	example/mu/ped-pdflatex.pdf example/mu/phil-lualatex.pdf \
	example/mu/phil-pdflatex.pdf example/mu/sci-lualatex.pdf \
	example/mu/sci-pdflatex.pdf \
	example/mu/resources/jabberwocky-dark.pdf \
	example/mu/resources/jabberwocky-light.pdf
DEVEXAMPLES=logo/EXAMPLE/DESCRIPTION logo/mu/DESCRIPTION \
	logo/DESCRIPTION theme/EXAMPLE/DESCRIPTION theme/mu/DESCRIPTION \
	theme/DESCRIPTION example/DESCRIPTION example/EXAMPLE/DESCRIPTION \
	example/mu/DESCRIPTION example/mu/resources/DESCRIPTION
EXAMPLES=$(USEREXAMPLES) $(DEVEXAMPLES)
RESOURCES=$(THEMEFILES) $(LOGOS)
SOURCES=$(DTXFILES) $(INSFILES) LICENSE.tex
AUXFILES=fibeamer.aux fibeamer.log fibeamer.toc fibeamer.ind \
	fibeamer.idx fibeamer.out fibeamer.ilg fibeamer.gls \
	fibeamer.glo fibeamer.hd
MANUAL=fibeamer.pdf
PDFSOURCES=fibeamer.dtx
PDFS=$(MANUAL) $(USEREXAMPLES)
DOCS=$(MANUAL) README
VERSION=VERSION.tex
TDSARCHIVE=fibeamer.tds.zip
CTANARCHIVE=fibeamer.ctan.zip
DISTARCHIVE=fibeamer.zip
ARCHIVES=$(TDSARCHIVE) $(CTANARCHIVE) $(DISTARCHIVE)
MAKEABLES=$(MANUAL) $(BASETHEMEFILE) $(ARCHIVES) $(VERSION)

TEXLIVEDIR=$(shell kpsewhich -var-value TEXMFLOCAL)

# This pseudo-target expands all the docstrip files, converts the
# logos and creates the theme files.
all: $(SUBMAKES_REQUIRED)
	make $(BASETHEMEFILE)

# This pseudo-target creates the theme files and typesets the
# technical documentation and the guides.
complete: all $(SUBMAKES)
	make $(PDFS) clean

# This pseudo-target calls a submakefile
$(SUBMAKES):
	make -C $@ all

# This pseudo-target creates the distribution archive.
dist: dist-implode complete
	make $(TDSARCHIVE) $(DISTARCHIVE) $(CTANARCHIVE)

# This target creates the theme files.
$(BASETHEMEFILE): fibeamer.ins fibeamer.dtx
	xetex $<

# This target typesets the technical documentation.
$(MANUAL): $(DTXFILES)
	pdflatex $<
	makeindex -s gind.ist $(basename $@)
	makeindex -s gglo.ist -o $(basename $@).gls $(basename $@).glo
	pdflatex $<
	pdflatex $<

# This target generates a TeX directory structure file
$(TDSARCHIVE):
	DIR=`mktemp -d` && \
	make install to="$$DIR" nohash=true && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ $@ && rm -rf "$$DIR"

# This target generates a distribution file
$(DISTARCHIVE): $(SOURCES) $(RESOURCES) $(MAKES) \
	$(DOCS) $(PDFSOURCES) $(EXAMPLES) $(VERSION) $(LOGOSOURCES)
	DIR=`mktemp -d` && \
	cp --verbose $(TDSARCHIVE) "$$DIR" && \
	cp --parents --verbose $^ "$$DIR" && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ . && rm -rf "$$DIR"

# This target generates a CTAN distribution file
$(CTANARCHIVE): $(SOURCES) $(MAKES) $(LOGOSOURCES) $(DOCS) \
	$(EXAMPLES) $(VERSION)
	DIR=`mktemp -d` && mkdir -p "$$DIR/fibeamer" && \
	cp --verbose $(TDSARCHIVE) "$$DIR" && \
	cp --parents --verbose $^ "$$DIR/fibeamer" && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ . && rm -rf "$$DIR"

# This pseudo-target installs the theme files and the technical
# documentation into the TeX directory structure, whose root
# directory is specified within the "to" argument. Specify
# "nohash=true", if you wish to forgo the reindexing of the package
# database.
install:
	@if [ -z "$(to)" ]; then \
		printf "Usage: make install to=DIRECTORY"; \
		printf "Detected TeXLive directory: %s\n" $(TEXLIVEDIR); \
		exit 1; \
	fi
	
	# Theme and logo files
	mkdir -p "$(to)/tex/latex/fibeamer"
	cp --parents --verbose $(RESOURCES) "$(to)/tex/latex/fibeamer"
	
	# Source files
	mkdir -p "$(to)/source/latex/fibeamer"
	cp --parents --verbose $(SOURCES) "$(to)/source/latex/fibeamer"
	
	# Documentation
	mkdir -p "$(to)/doc/latex/fibeamer"
	cp --parents --verbose $(DOCS) "$(to)/doc/latex/fibeamer"
	
	# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash

# This pseudo-target installs the theme files and the technical
# documentation into the TeX directory structure, whose root
# directory is specified within the "to" argument. Specify
# "nohash=true", if you wish to forgo the reindexing of the package
# database.
uninstall:
	@if [ -z "$(from)" ]; then \
		printf "Usage: make uninstall from=DIRECTORY"; \
		printf "Detected TeXLive directory: %s\n" $(TEXLIVEDIR); \
		exit 1; \
	fi
	
	# Theme and logo files
	rm -rf "$(from)/tex/latex/fibeamer"
	
	# Source files
	rm -rf "$(from)/source/latex/fibeamer"
	
	# Documentation
	rm -rf "$(from)/doc/latex/fibeamer"
	
	# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes the distribution archives.
dist-implode:
	rm -f $(ARCHIVES)

# This pseudo-target removes any makeable files.
implode: clean
	rm -f $(MAKEABLES)
	for dir in $(SUBMAKES); do make implode -C "$$dir"; done
