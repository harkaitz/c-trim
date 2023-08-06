PROJECT   =c-trim
VERSION   =1.0.0
DESTDIR   =
PREFIX    =/usr/local
CC        =cc
CFLAGS    =-Wall -g
PROGRAMS  =tools/trim$(EXE) tools/trim-gaps$(EXE)
HEADERS   =trim.h
## -- targets
all: $(PROGRAMS)
clean:
	rm -f $(PROGRAMS)
install: $(PROGRAMS)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/str
## -- programs
tools/trim$(EXE): tools/trim.c trim.h
	$(CC) -o $@ tools/trim.c $(CPPFLAGS) $(CFLAGS)
tools/trim-gaps$(EXE): tools/trim-gaps.c trim.h
	$(CC) -o $@ tools/trim-gaps.c $(CPPFLAGS) $(CFLAGS)
## -- BLOCK:license --
install: install-license
install-license: 
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
	cp LICENSE README.md $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
update: update-license
update-license:
	ssnip README.md
## -- BLOCK:license --
## -- BLOCK:man --
update: update-man
update-man:
	make-h-man update
install: install-man
install-man:
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./trim.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- BLOCK:man --
