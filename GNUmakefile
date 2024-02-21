PROJECT   =c-trim
VERSION   =1.0.0
DESTDIR   =
PREFIX    =/usr/local
CC        =gcc -pedantic-errors -std=c99 -Wall
PROGRAMS  =tools/trim$(EXE) tools/trim-gaps$(EXE)
HEADERS   =trim.h
##
all: $(PROGRAMS)
clean:
	rm -f $(PROGRAMS)
install: $(PROGRAMS)
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/str
tools/trim$(EXE): tools/trim.c trim.h
	$(CC) -o $@ tools/trim.c $(CPPFLAGS) $(CFLAGS)
tools/trim-gaps$(EXE): tools/trim-gaps.c trim.h
	$(CC) -o $@ tools/trim-gaps.c $(CPPFLAGS) $(CFLAGS)
## -- BLOCK:license --
install: install-license
install-license: 
	@mkdir -p $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
	cp LICENSE  $(DESTDIR)$(PREFIX)/share/doc/$(PROJECT)
## -- BLOCK:license --
## -- BLOCK:man --
install: install-man
install-man:
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./trim.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- BLOCK:man --
