DESTDIR   =
PREFIX    =/usr/local
CC        =gcc
CFLAGS    =-Wall -g
PROG_TRIM =tools/trim$(EXE)

all: $(PROG_TRIM)
clean:
	rm -f $(PROG_TRIM)
install: $(PROG_TRIM)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/include/str
	cp $(PROG_TRIM) $(DESTDIR)$(PREFIX)/bin
	cp trim.h       $(DESTDIR)$(PREFIX)/include/str
$(PROG_TRIM): tools/trim.c trim.h
	$(CC) -o $@ tools/trim.c $(CFLAGS)


## -- manpages --
install: install-man
install-man: ./trim.3.md 
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp ./trim.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-trim
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-trim
## -- license --
