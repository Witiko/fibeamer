EPSFILES=fibeamer-mu-econ-czech.eps fibeamer-mu-econ-english.eps \
	fibeamer-mu-fi-czech.eps fibeamer-mu-fi-english.eps \
	fibeamer-mu-fsps-czech.eps fibeamer-mu-fsps-english.eps \
	fibeamer-mu-fss-czech.eps fibeamer-mu-fss-english.eps \
	fibeamer-mu-law-czech.eps fibeamer-mu-law-english.eps \
	fibeamer-mu-med-czech.eps fibeamer-mu-med-english.eps \
	fibeamer-mu-ped-czech.eps fibeamer-mu-ped-english.eps \
	fibeamer-mu-phil-czech.eps fibeamer-mu-phil-english.eps \
	fibeamer-mu-sci-czech.eps fibeamer-mu-sci-english.eps
.PHONY: all implode

# This target converts all the PDF logos to EPS.
all: $(EPSFILES)

# This target converts a single PDF logo to EPS.
%.eps: %.pdf
	inkscape $< --export-eps=$@

# This target removes all EPS logos.
implode:
	rm -f $(EPSFILES)
