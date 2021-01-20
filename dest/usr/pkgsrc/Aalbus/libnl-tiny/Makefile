# $NetBSD: Makefile,v 1.2 2019/08/06 11:13:07 gdt Exp $

VERSION=	1.0.1

PKGNAME=	libnl-tiny-${VERSION}
DISTNAME=       ${PKGNAME}

CATEGORIES=	devel
MASTER_SITES=	http://ftp.barfooze.de/pub/sabotage/tarballs/
EXTRACT_SUFX=	.tar.xz
MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://github.com/sabotage-linux/libnl-tiny
COMMENT=	Small alternative for libnl
LICENSE=	mit

WRKSRC=		${WRKDIR}/${PKGNAME}

USE_TOOLS+=             gmake

CPPFLAGS+=	-Wno-macro-redefined

MAKE_FLAGS+=	CC=clang
MAKE_FLAGS+=	prefix=/usr
MAKE_FLAGS+=	sysconfdir=/etc
MAKE_FLAGS+=	all

pre-build:
		mkdir -p ${DESTDIR}${PREFIX}/lib/pkgconfig
		mkdir -p ${DESTDIR}${PREFIX}/include

.include "../../mk/bsd.pkg.mk"
