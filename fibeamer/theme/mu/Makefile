LOGS=base.log law.log econ.log fi.log fsps.log fss.log med.log \
	ped.log phil.log sci.log
OUTPUT= \
	beamercolorthemefibeamer-mu.sty	beamerfontthemefibeamer-mu.sty \
	beamerinnerthemefibeamer-mu.sty beamerouterthemefibeamer-mu.sty \
	beamercolorthemefibeamer-mu-law.sty \
	beamercolorthemefibeamer-mu-econ.sty \
	beamercolorthemefibeamer-mu-fi.sty \
	beamercolorthemefibeamer-mu-fsps.sty \
	beamercolorthemefibeamer-mu-fss.sty \
	beamercolorthemefibeamer-mu-med.sty \
	beamercolorthemefibeamer-mu-ped.sty \
	beamercolorthemefibeamer-mu-phil.sty \
	beamercolorthemefibeamer-mu-sci.sty

.PHONY: explode implode clean all
all: explode
explode: $(LOGS)

%.log: %.ins %.dtx
	xetex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
