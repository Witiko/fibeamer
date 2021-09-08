LOGS=base.log standard.log
OUTPUT= \
	beamercolorthemefibeamer-bs.sty	beamerfontthemefibeamer-bs.sty \
	beamerinnerthemefibeamer-bs.sty beamerouterthemefibeamer-bs.sty \
	beamercolorthemefibeamer-bs-standard.sty \

.PHONY: explode implode clean all
all: explode
explode: $(LOGS)

%.log: %.ins %.dtx
	xetex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
