PDFFILES=fibeamer-mu-econ-light.pdf fibeamer-mu-fsps-light.pdf \
	fibeamer-mu-law-light.pdf fibeamer-mu-med-light.pdf \
	fibeamer-mu-ped-light.pdf fibeamer-mu-phil-light.pdf \
	fibeamer-mu-sci-light.pdf fibeamer-mu-fi-light.pdf \
	fibeamer-mu-fss-light.pdf fibeamer-mu-econ-dark.pdf \
	fibeamer-mu-fsps-dark.pdf fibeamer-mu-law-dark.pdf \
	fibeamer-mu-med-dark.pdf fibeamer-mu-ped-dark.pdf \
	fibeamer-mu-phil-dark.pdf fibeamer-mu-sci-dark.pdf \
	fibeamer-mu-fi-dark.pdf fibeamer-mu-fss-dark.pdf
EPSFILES=fibeamer-mu-econ-light.eps fibeamer-mu-fsps-light.eps \
	fibeamer-mu-law-light.eps fibeamer-mu-med-light.eps \
	fibeamer-mu-ped-light.eps fibeamer-mu-phil-light.eps \
	fibeamer-mu-sci-light.eps fibeamer-mu-fi-light.eps \
	fibeamer-mu-fss-light.eps fibeamer-mu-econ-dark.eps \
	fibeamer-mu-fsps-dark.eps fibeamer-mu-law-dark.eps \
	fibeamer-mu-med-dark.eps fibeamer-mu-ped-dark.eps \
	fibeamer-mu-phil-dark.eps fibeamer-mu-sci-dark.eps \
	fibeamer-mu-fi-dark.eps fibeamer-mu-fss-dark.eps
OUTPUT=$(PDFFILES) $(EPSFILES)
.PHONY: all implode

all: $(OUTPUT)

%.pdf: %.svg
	inkscape $< --export-pdf=$@

%.eps: %.pdf
	pdftops -eps $<

implode:
	rm -f $(OUTPUT)
