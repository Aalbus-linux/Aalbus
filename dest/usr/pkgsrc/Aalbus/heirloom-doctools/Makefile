# $NetBSD: Makefile,v 1.5 2020/01/18 23:35:26 rillig Exp $

DISTNAME=	heirloom-doctools-191015
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=n-t-roff/}

MAINTAINER=	carsten.kunze@arcor.de
HOMEPAGE=	https://n-t-roff.github.io/heirloom/doctools.html
COMMENT=	Modernized troff implementation
LICENSE=	cddl-1.0

MAKE_JOBS_SAFE=	no

USE_LANGUAGES=	c c++
USE_TOOLS+=	lex yacc

MAKE_FLAGS=	CC=${CC:Q} \
		CCC=${CXX:Q} \
		CFLAGS=${CFLAGS:Q} \
		RANLIB=ranlib \
		INSTALL=install \
		ROOT=${DESTDIR} \
		BINDIR=${PREFIX}/bin \
		MANDIR=${PREFIX}/share/man \
		LIBDIR=${PREFIX}/libexec \
		MACDIR=${PREFIX}/share/tmac \
		FNTDIR=${PREFIX}/share/font \
		TABDIR=${PREFIX}/share/nterm \
		HYPDIR=${PREFIX}/share/hyphen \
		PUBDIR=${PREFIX}/share/pub \
		PSTDIR=${PREFIX}/share/font/devpost/postscript \
		REFDIR=${PREFIX}/libexec/reftools

#remove files that conflict with nbase and mandoc
post-install:
	                rm ${DESTDIR}${PREFIX}/bin/col
		        rm ${DESTDIR}${PREFIX}/bin/soelim
			rm ${DESTDIR}${PREFIX}/share/man/man1/soelim.1
			rm ${DESTDIR}${PREFIX}/share/man/man7/man.7
			rm ${DESTDIR}${PREFIX}/share/man/man7/mdoc.7	

MAKE_FILE=	makefile
BUILD_TARGET=	dummy

.include "../../mk/bsd.pkg.mk"
