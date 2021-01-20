# $NetBSD: Makefile,v 1.1 2013/01/03 21:11:34 mrampke Exp $

DISTNAME=	libmd-1.0.3
EXTRACT_SUFX=	.tar.xz
NO_CHECKSUM=	yes
MASTER_SITES=	https://archive.hadrons.org/software/libmd/

CATEGORIES=	devel

HOMEPAGE=	http://libbsd.freedesktop.org/
COMMENT=	Compatibility library for BSD message digest functions under other systems
LICENSE=	original-bsd
MAINTAINER=	matthias@rampke.de

.include "Makefile.common"
ONLY_FOR_PLATFORM= ${LIBBSD.only_for_platform}

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}

#remove conflicst with skey
post-install:
	                rm ${DESTDIR}${PREFIX}/include/rmd160.h
			rm $(DESTDIR)$(PREFIX)/include/sha1.h

.include "../../mk/bsd.pkg.mk"
