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
## -- manpages --
install: install-man3
install-man3:
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./trim.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-trim
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-trim
## -- license --
