VERSION:=$(shell cat VERSION)
PACKAGE=Dymo-$(VERSION)
TARBALL=$(PACKAGE).tar.gz
DATAPKG=Dymodata-$(VERSION)
DATATAR=$(DATAPKG).tar.gz

#
# Fonts here are ordered triplets of min. population, file name, font size.
#
FONTS_Z4=  --font 0 fonts/Arial.ttf 10   --font 250000 fonts/Arial.ttf 12
FONTS_Z5=  --font 0 fonts/Arial.ttf 10   --font 2500000 fonts/Arial.ttf 12
FONTS_Z6=  --font 0 fonts/Arial.ttf 10   --font 250000 fonts/Arial.ttf 13   --font 2500000 fonts/Arial.ttf 18
FONTS_Z7=  --font 0 fonts/Arial.ttf 10   --font 250000 fonts/Arial.ttf 13   --font 2500000 fonts/Arial.ttf 18
FONTS_Z8=  --font 0 fonts/Arial.ttf 10   --font 50000 fonts/Arial.ttf 13    --font 250000 fonts/Arial.ttf 18
FONTS_Z9=  --font 0 fonts/Arial.ttf 10   --font 50000 fonts/Arial.ttf 13    --font 250000 fonts/Arial.ttf 18
FONTS_Z10= --font 0 fonts/Arial.ttf 10   --font 50000 fonts/Arial.ttf 13    --font 250000 fonts/Arial.ttf 18
FONTS_Z11= --font 0 fonts/Arial.ttf 10   --font 50000 fonts/Arial.ttf 13    --font 250000 fonts/Arial.ttf 18



all: $(TARBALL) $(DATATAR)

$(TARBALL):
	mkdir $(PACKAGE)
	ln setup.py $(PACKAGE)/
	ln VERSION $(PACKAGE)/
	ln dymo-*.py $(PACKAGE)/

	mkdir $(PACKAGE)/Dymo
	ln Dymo/*.py $(PACKAGE)/Dymo/

	rm $(PACKAGE)/Dymo/__init__.py
	cp Dymo/__init__.py $(PACKAGE)/Dymo/__init__.py
	perl -pi -e 's#\bN\.N\.N\b#$(VERSION)#' $(PACKAGE)/Dymo/__init__.py

	tar -czf $(TARBALL) $(PACKAGE)
	rm -rf $(PACKAGE)

$(DATATAR): data
	mkdir $(DATAPKG)

	mkdir $(DATAPKG)/data
	ln data/Africa-*.* $(DATAPKG)/data/
	ln data/Asia-*.* $(DATAPKG)/data/
	ln data/Australia-New-Zealand-*.* $(DATAPKG)/data/
	ln data/Europe-*.* $(DATAPKG)/data/
	ln data/North-America-*.* $(DATAPKG)/data/
	ln data/South-America-*.* $(DATAPKG)/data/
	ln data/US-*.* $(DATAPKG)/data/

	mkdir $(DATAPKG)/fonts
	ln fonts/*.ttf $(DATAPKG)/fonts/

	tar -czf $(DATATAR) $(DATAPKG)
	rm -rf $(DATAPKG)

data: \
	data/North-America-z4.txt data/North-America-z5.txt \
	data/North-America-z6.txt.gz data/North-America-z7.txt.gz \
	data/North-America-z8.txt.gz data/North-America-z9.txt.gz \
	data/North-America-z10.txt.gz data/North-America-z11.txt.gz \
	data/Europe-z4.txt data/Europe-z5.txt data/Europe-z6.txt.gz \
	data/Europe-z7.txt.gz data/Europe-z8.txt.gz data/Europe-z9.txt.gz \
	data/Europe-z10.txt.gz data/Europe-z11.txt.gz \
	data/South-America-z4.txt data/South-America-z5.txt \
	data/South-America-z6.txt.gz data/South-America-z7.txt.gz \
	data/South-America-z8.txt.gz data/South-America-z9.txt.gz \
	data/South-America-z10.txt.gz data/South-America-z11.txt.gz \
	data/Asia-z4.txt data/Asia-z5.txt data/Asia-z6.txt.gz data/Asia-z7.txt.gz \
	data/Asia-z8.txt.gz data/Asia-z9.txt.gz data/Asia-z10.txt.gz \
	data/Asia-z11.txt.gz \
	data/Africa-z4.txt data/Africa-z5.txt data/Africa-z6.txt.gz \
	data/Africa-z7.txt.gz data/Africa-z8.txt.gz data/Africa-z9.txt.gz \
	data/Africa-z10.txt.gz data/Africa-z11.txt.gz \
	data/Australia-New-Zealand-z4.txt data/Australia-New-Zealand-z5.txt \
	data/Australia-New-Zealand-z6.txt.gz data/Australia-New-Zealand-z7.txt.gz \
	data/Australia-New-Zealand-z8.txt.gz data/Australia-New-Zealand-z9.txt.gz \
	data/Australia-New-Zealand-z10.txt.gz data/Australia-New-Zealand-z11.txt.gz

clean:
	find Dymo -name '*.pyc' -delete
	rm -rf $(TARBALL)
	rm -rf $(DATATAR)




data/North-America-z4.txt: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 4 --radius 5 $(FONTS_Z4) data/North-America-all.txt.gz $@

data/North-America-z5.txt: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 5 --radius 5 $(FONTS_Z5) data/North-America-all.txt.gz $@

data/North-America-z6.txt.gz: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 6 --radius 5 $(FONTS_Z6) data/North-America-all.txt.gz $@

data/North-America-z7.txt.gz: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 7 --radius 5 $(FONTS_Z7) data/North-America-all.txt.gz $@

data/North-America-z8.txt.gz: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 8 --radius 5 $(FONTS_Z8) data/North-America-all.txt.gz $@

data/North-America-z9.txt.gz: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 9 --radius 5 $(FONTS_Z9) data/North-America-all.txt.gz $@

data/North-America-z10.txt.gz: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 10 --radius 5 $(FONTS_Z10) data/North-America-all.txt.gz $@

data/North-America-z11.txt.gz: data/North-America-all.txt.gz
	python dymo-prepare-places.py --zoom 11 --radius 5 $(FONTS_Z11) data/North-America-all.txt.gz $@



data/Europe-z4.txt: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 4 --radius 5 $(FONTS_Z4) data/Europe-all.txt.gz $@

data/Europe-z5.txt: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 5 --radius 5 $(FONTS_Z5) data/Europe-all.txt.gz $@

data/Europe-z6.txt.gz: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 6 --radius 5 $(FONTS_Z6) data/Europe-all.txt.gz $@

data/Europe-z7.txt.gz: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 7 --radius 5 $(FONTS_Z7) data/Europe-all.txt.gz $@

data/Europe-z8.txt.gz: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 8 --radius 5 $(FONTS_Z8) data/Europe-all.txt.gz $@

data/Europe-z9.txt.gz: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 9 --radius 5 $(FONTS_Z9) data/Europe-all.txt.gz $@

data/Europe-z10.txt.gz: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 10 --radius 5 $(FONTS_Z10) data/Europe-all.txt.gz $@

data/Europe-z11.txt.gz: data/Europe-all.txt.gz
	python dymo-prepare-places.py --zoom 11 --radius 5 $(FONTS_Z11) data/Europe-all.txt.gz $@



data/South-America-z4.txt: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 4 --radius 5 $(FONTS_Z4) data/South-America-all.txt.gz $@

data/South-America-z5.txt: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 5 --radius 5 $(FONTS_Z5) data/South-America-all.txt.gz $@

data/South-America-z6.txt.gz: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 6 --radius 5 $(FONTS_Z6) data/South-America-all.txt.gz $@

data/South-America-z7.txt.gz: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 7 --radius 5 $(FONTS_Z7) data/South-America-all.txt.gz $@

data/South-America-z8.txt.gz: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 8 --radius 5 $(FONTS_Z8) data/South-America-all.txt.gz $@

data/South-America-z9.txt.gz: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 9 --radius 5 $(FONTS_Z9) data/South-America-all.txt.gz $@

data/South-America-z10.txt.gz: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 10 --radius 5 $(FONTS_Z10) data/South-America-all.txt.gz $@

data/South-America-z11.txt.gz: data/South-America-all.txt.gz
	python dymo-prepare-places.py --zoom 11 --radius 5 $(FONTS_Z11) data/South-America-all.txt.gz $@



data/Asia-z4.txt: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 4 --radius 5 $(FONTS_Z4) data/Asia-all.txt.gz $@

data/Asia-z5.txt: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 5 --radius 5 $(FONTS_Z5) data/Asia-all.txt.gz $@

data/Asia-z6.txt.gz: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 6 --radius 5 $(FONTS_Z6) data/Asia-all.txt.gz $@

data/Asia-z7.txt.gz: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 7 --radius 5 $(FONTS_Z7) data/Asia-all.txt.gz $@

data/Asia-z8.txt.gz: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 8 --radius 5 $(FONTS_Z8) data/Asia-all.txt.gz $@

data/Asia-z9.txt.gz: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 9 --radius 5 $(FONTS_Z9) data/Asia-all.txt.gz $@

data/Asia-z10.txt.gz: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 10 --radius 5 $(FONTS_Z10) data/Asia-all.txt.gz $@

data/Asia-z11.txt.gz: data/Asia-all.txt.gz
	python dymo-prepare-places.py --zoom 11 --radius 5 $(FONTS_Z11) data/Asia-all.txt.gz $@



data/Africa-z4.txt: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 4 --radius 5 $(FONTS_Z4) data/Africa-all.txt.gz $@

data/Africa-z5.txt: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 5 --radius 5 $(FONTS_Z5) data/Africa-all.txt.gz $@

data/Africa-z6.txt.gz: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 6 --radius 5 $(FONTS_Z6) data/Africa-all.txt.gz $@

data/Africa-z7.txt.gz: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 7 --radius 5 $(FONTS_Z7) data/Africa-all.txt.gz $@

data/Africa-z8.txt.gz: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 8 --radius 5 $(FONTS_Z8) data/Africa-all.txt.gz $@

data/Africa-z9.txt.gz: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 9 --radius 5 $(FONTS_Z9) data/Africa-all.txt.gz $@

data/Africa-z10.txt.gz: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 10 --radius 5 $(FONTS_Z10) data/Africa-all.txt.gz $@

data/Africa-z11.txt.gz: data/Africa-all.txt.gz
	python dymo-prepare-places.py --zoom 11 --radius 5 $(FONTS_Z11) data/Africa-all.txt.gz $@



data/Australia-New-Zealand-z4.txt: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 4 --radius 5 $(FONTS_Z4) data/Australia-New-Zealand-all.txt.gz $@

data/Australia-New-Zealand-z5.txt: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 5 --radius 5 $(FONTS_Z5) data/Australia-New-Zealand-all.txt.gz $@

data/Australia-New-Zealand-z6.txt.gz: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 6 --radius 5 $(FONTS_Z6) data/Australia-New-Zealand-all.txt.gz $@

data/Australia-New-Zealand-z7.txt.gz: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 7 --radius 5 $(FONTS_Z7) data/Australia-New-Zealand-all.txt.gz $@

data/Australia-New-Zealand-z8.txt.gz: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 8 --radius 5 $(FONTS_Z8) data/Australia-New-Zealand-all.txt.gz $@

data/Australia-New-Zealand-z9.txt.gz: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 9 --radius 5 $(FONTS_Z9) data/Australia-New-Zealand-all.txt.gz $@

data/Australia-New-Zealand-z10.txt.gz: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 10 --radius 5 $(FONTS_Z10) data/Australia-New-Zealand-all.txt.gz $@

data/Australia-New-Zealand-z11.txt.gz: data/Australia-New-Zealand-all.txt.gz
	python dymo-prepare-places.py --zoom 11 --radius 5 $(FONTS_Z11) data/Australia-New-Zealand-all.txt.gz $@
