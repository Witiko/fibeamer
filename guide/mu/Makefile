PDFFILES=fi.pdf sci.pdf ped.pdf med.pdf fss.pdf fsps.pdf phil.pdf \
	law.pdf econ.pdf
TEX=pdflatex -shell-escape
.PHONY: all clean
all: clean
	make $(PDFFILES) clean

# This target typesets a PDF file.
%.pdf: %.tex guide.bib
	$(TEX) $(basename $@).tex
	biber  $(basename $@)
	$(TEX) $(basename $@).tex

# This target prepares a TeX file.
%.tex: %.ins guide.dtx
	xetex $<

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.bbl *.blg *.pyg \
		*.bcf *-blx.bib *.run.xml *.tex
	rm -rf _minted-*

# This target removes any auxiliary files and the output files.
implode: clean
	rm -f $(PDFFILES)
