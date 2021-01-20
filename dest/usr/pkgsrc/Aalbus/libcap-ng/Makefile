# $NetBSD: Makefile,v 1.4 2020/08/31 18:11:28 wiz Exp $

VERSION=	0.8.2
DISTNAME=	v$(VERSION)
PKGNAME=	libcap-ng-$(VERSION)
WRKSRC=		${WRKDIR}/libcap-ng-$(VERSION)
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/stevegrubb/libcap-ng/archive/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://sites.google.com/site/fullycapable/
COMMENT=	Library for getting and setting POSIX.1e capabilities
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	pkg-config gmake perl

ONLY_FOR_PLATFORM=	Linux-*-*

GNU_CONFIGURE=	yes

MAKE_FLAGS+=	LIBDIR=${PREFIX}/lib
MAKE_FLAGS+=	SBINDIR=${PREFIX}/sbin
MAKE_FLAGS+=	INCDIR=${PREFIX}/include
MAKE_FLAGS+=	MANDIR=${PREFIX}/${PKGMANDIR}
MAKE_FLAGS+=	PKGCONFIGDIR=${PREFIX}/lib/pkgconfig

INSTALL_MAKE_FLAGS+=	RAISE_SETFCAP=no
INSTALL_MAKE_FLAGS+=	DESTDIR=${DESTDIR}

.include "../../mk/bsd.pkg.mk"
