DESTDIR   =
PREFIX    =/usr/local
CC        =gcc
CFLAGS    =-Wall -g
PROGRAMS  =tools/trim$(EXE) tools/trim-gaps$(EXE)

## --------------
all: $(PROGRAMS)
clean:
	rm -f $(PROGRAMS)
install: $(PROGRAMS)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
	cp trim.h      $(DESTDIR)$(PREFIX)/include/str

## --------------
tools/trim$(EXE): tools/trim.c trim.h
	$(CC) -o $@ tools/trim.c $(CPPFLAGS) $(CFLAGS)
tools/trim-gaps$(EXE): tools/trim-gaps.c trim.h
	$(CC) -o $@ tools/trim-gaps.c $(CPPFLAGS) $(CFLAGS)


## -- manpages --
ifneq ($(PREFIX),)
MAN_3=./trim.3 
install: install-man3
install-man3: $(MAN_3)
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp $(MAN_3) $(DESTDIR)$(PREFIX)/share/man/man3
endif
## -- manpages --
## -- license --
ifneq ($(PREFIX),)
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-trim
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-trim
endif
## -- license --
