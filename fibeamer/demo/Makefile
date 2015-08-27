PDFFILES=sci.pdf phil.pdf ped.pdf med.pdf fss.pdf fi.pdf law.pdf \
	econ.pdf fsps.pdf
TEXFILES=sci.tex phil.tex ped.tex med.tex fss.tex fi.tex law.tex \
	econ.tex fsps.tex
AUXFILES=*.aux *.log *.nav *.out *.snm *.toc
SRC=source.tex
TEX=xelatex
.PHONY: all clean
all: $(PDFFILES) clean

# This target typesets a PDF file.
$(PDFFILES): $(TEMPLATE)
	sed s/faculty=?/faculty=$(basename $@)/ $(SRC) > $(basename $@).tex
	$(TEX) $(basename $@).tex
	$(TEX) $(basename $@).tex

# This target removes any auxiliary files.
clean:
	rm -f $(TEXFILES) $(AUXFILES)

# This target removes any auxiliary files
# and the output PDF files.
implode: clean
	rm -f $(PDFFILES)
