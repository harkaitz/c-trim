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
install: install-man3
install-man3:
	@echo 'I share/man/man3/'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	@echo 'I share/man/man3/trim.3'
	@cp ./trim.3 $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
ifneq ($(PREFIX),)
install: install-license
install-license: LICENSE
	@echo 'I share/doc/c-trim/LICENSE'
	@mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-trim
	@cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-trim
endif
## -- license --
