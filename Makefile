# $Id: Makefile,v 1.9 2004-11-20 20:42:38 mitch Exp $
#
# dist-script for p0rn-comfort
#
# 2004 (C) by Christian Garbs <mitch@cgarbs.de>
# Licensed under GNU GPL.  See COPYING for details.

NAME=p0rn-comfort
VERSION=$(shell grep 'our \$$VERSION' P0rn/Static.pm | cut -d \" -f 2)
DISTDIR=$(NAME)-$(VERSION)
TARGZ=$(NAME)-$(VERSION).tar.gz

PERLSCRIPTS=p0rn-bot p0rn-dbadd p0rn-dbdel p0rn-dblist p0rn-download p0rn-proxy p0rn-dbrestore
SHELLSCRIPTS=p0rn-dbdump p0rn-grab
MODULES=DB Static
BINARIES=$(PERLSCRIPTS) $(SHELLSCRIPTS)
OTHERFILES=ChangeLog README COPYRIGHT

DOCDIR=./docs
POD2MANOPTS=--release=$(VERSION) --center=$(NAME) --section=1

all: generate-manpages dist

generate-manpages:
	rm -rf $(DOCDIR)
	mkdir $(DOCDIR)
	for FILE in $(PERLSCRIPTS);  do pod2man $(POD2MANOPTS) $$FILE     $(DOCDIR)/$$FILE.1; done
	for FILE in $(SHELLSCRIPTS); do pod2man $(POD2MANOPTS) $$FILE.pod $(DOCDIR)/$$FILE.1; done

dist:
	rm -rf $(DISTDIR)
	mkdir $(DISTDIR)
	mkdir $(DISTDIR)/P0rn
	mkdir $(DISTDIR)/out
	mkdir $(DISTDIR)/$(DOCDIR)
	cp $(BINARIES) $(OTHERFILES) $(DISTDIR)/
	for FILE in $(MODULES); do cp P0rn/$$FILE.pm $(DISTDIR)/P0rn/; done
	cp $(DOCDIR)/* $(DISTDIR)/$(DOCDIR)
	tar -c $(DISTDIR) -zvf $(TARGZ)
	rm -rf $(DISTDIR)
