README.md: README.md.template
	expand-macros.py $< $@

install:
	install exec-cache-* ~/bin
