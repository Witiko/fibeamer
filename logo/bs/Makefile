EPSFILES=fibeamer-bs-standard-english.eps fibeamer-bs-standard-italian.eps
.PHONY: all implode

# This target converts all the PDF logos to EPS.
all: $(EPSFILES)

# This target converts a single PDF logo to EPS.
%.eps: %.pdf
	inkscape $< --export-eps=$@

# This target removes all EPS logos.
implode:
	rm -f $(EPSFILES)
