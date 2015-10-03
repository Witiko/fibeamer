.PHONY: all clean
all:
	make -C fibeamer
	make pdflatex.pdf xelatex.pdf lualatex.pdf \
		latex.dvi latex.pdf clean

# This target typesets the pdfLaTeX example.
pdflatex.pdf: pdflatex.tex
	pdflatex $<
	pdflatex $<

# This target typesets the XeLaTeX example.
xelatex.pdf: xelatex.tex
	xelatex $<
	xelatex $<

# This target typesets the LuaLaTeX example.
lualatex.pdf: lualatex.tex
	lualatex $<
	lualatex $<

# These targets typeset the LaTeX example.
latex.pdf: latex.dvi
	dvipdfmx $<

latex.dvi: latex.tex
	latex $<
	latex $<

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.nav *.snm *.vrb

# This target removes any auxiliary files
# and the output PDF file.
implode: clean
	rm -f pdflatex.pdf xelatex.pdf lualatex.pdf latex.pdf latex.dvi
