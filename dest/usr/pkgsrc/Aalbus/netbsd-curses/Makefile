# $NetBSD: Makefile,v 1.2 2019/08/06 11:13:07 gdt Exp $

VERSION=	0.3.1

PKGNAME=	netbsd-curses-${VERSION}
DISTNAME=       ${PKGNAME}

CATEGORIES=	devel
MASTER_SITES=	http://ftp.barfooze.de/pub/sabotage/tarballs/
EXTRACT_SUFX=	.tar.xz
MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://github.com/sabotage-linux/netbsd-curses
COMMENT=	Smaller alternative to ncurses
LICENSE=	2-clause-bsd

WRKSRC=		${WRKDIR}/${PKGNAME}

USE_TOOLS+=             gmake


MAKE_FLAGS+=	CC=clang
MAKE_FLAGS+=	PREFIX=/usr
MAKE_FLAGS+=	sysconfdir=/etc

pre-build:
	cp ./files/names.awk ${WRKSRC}/libterminfo/
	cp ./files/Makefile ${WRKSRC}/Makefile
	cp ./files/libterminfo_term.h ${WRKSRC}/libterminfo/term.h
	cp ./files/libterminfo_GNUmakefile ${WRKSRC}/libterminfo/Makefile

post-install:
	mv ${DESTDIR}${PREFIX}/share/man/man3/attr_get.3 ${DESTDIR}${PREFIX}/share/man/man3/attr_get.3b
	mv ${DESTDIR}${PREFIX}/share/man/man3/attr_set.3 ${DESTDIR}${PREFIX}/share/man/man3/attr_set.3b

.include "../../mk/bsd.pkg.mk"
