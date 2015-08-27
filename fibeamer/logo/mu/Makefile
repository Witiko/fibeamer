PDFFILES=fibeamer-mu-econ-light.pdf fibeamer-mu-fsps-light.pdf \
	fibeamer-mu-law-light.pdf fibeamer-mu-med-light.pdf \
	fibeamer-mu-ped-light.pdf fibeamer-mu-phil-light.pdf \
	fibeamer-mu-sci-light.pdf fibeamer-mu-fi-light.pdf \
	fibeamer-mu-fss-light.pdf fibeamer-mu-econ-dark.pdf \
	fibeamer-mu-fsps-dark.pdf fibeamer-mu-law-dark.pdf \
	fibeamer-mu-med-dark.pdf fibeamer-mu-ped-dark.pdf \
	fibeamer-mu-phil-dark.pdf fibeamer-mu-sci-dark.pdf \
	fibeamer-mu-fi-dark.pdf fibeamer-mu-fss-dark.pdf
.PHONY: all implode

all: $(PDFFILES)

%.pdf: %.svg
	inkscape $< --export-pdf=$@

implode:
	rm -f $(PDFFILES)
