# $Id: Makefile,v 1.1 2004-05-09 11:28:22 mitch Exp $

NAME=p0rn-comfort
DISTDIR=$(NAME)
TARGZ=$(NAME).tar.gz

dist:
	rm -rf $(DISTDIR)
	mkdir $(DISTDIR)
	mkdir $(DISTDIR)/P0rn
	mkdir $(DISTDIR)/out
	cp p0rn-dbadd p0rn-dbdel p0rn-dblist p0rn-download p0rn-grab p0rn-proxy README $(DISTDIR)/
	cp P0rn/DB.pm $(DISTDIR)/P0rn/
	tar -c $(DISTDIR) -zvf $(TARGZ)
	rm -rf $(DISTDIR)
