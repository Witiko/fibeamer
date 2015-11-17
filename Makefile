PDFFILES=mu-fi-pdflatex.pdf mu-fi-lualatex.pdf \
	mu-sci-pdflatex.pdf mu-sci-lualatex.pdf mu-ped-pdflatex.pdf \
	mu-ped-lualatex.pdf mu-med-pdflatex.pdf mu-med-lualatex.pdf \
	mu-fss-pdflatex.pdf mu-fss-lualatex.pdf  mu-fsps-pdflatex.pdf \
	mu-fsps-lualatex.pdf mu-phil-pdflatex.pdf mu-phil-lualatex.pdf \
	mu-law-pdflatex.pdf mu-law-lualatex.pdf mu-econ-pdflatex.pdf \
	mu-econ-lualatex.pdf
TEXFILES=$(PDFFILES:.pdf=.tex)
.PHONY: all clean
all:
	make -C fibeamer
	make $(TEXFILES) $(PDFFILES) clean

# This target prepares a TeX file.
%-pdflatex.tex: %.ins example.dtx
	xetex $<
%-lualatex.tex: %.ins example.dtx
	xetex $<

# This target typesets a pdfLaTeX example.
%-pdflatex.pdf: %-pdflatex.tex
	pdflatex $<
	pdflatex $<

# This target typesets a LuaLaTeX example.
%-lualatex.pdf: %-lualatex.tex
	lualatex $<
	lualatex $<

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.bcf *.blg *.run.xml \
		*.bbl *.idx *.ind *.ilg *.dvi *.nav *.snm

# This target removes any auxiliary files
# and the output PDF files.
implode: clean
	rm -f $(PDFFILES) $(TEXFILES)
