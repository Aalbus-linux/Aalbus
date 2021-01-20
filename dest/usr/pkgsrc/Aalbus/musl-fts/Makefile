# $NetBSD: Makefile,v 1.2 2019/08/06 11:13:07 gdt Exp $

VERSION=	1.2.7
DISTNAME=	v${VERSION}
PKGNAME=	musl-fts-${VERSION}
CATEGORIES=	devel
MASTER_SITES=	https://github.com/pullmoll/musl-fts/archive/
EXTRACT_SUFX=	.tar.gz
MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://github.com/pullmoll/musl-fts
COMMENT=	NetBSD-derived implementation of fts
LICENSE=	2-clause-bsd

WRKSRC=		${WRKDIR}/${PKGNAME}

USE_TOOLS+=             gmake
HAS_CONFIGURE=          yes
CONFIGURE_ARGS+=        --prefix=/usr
CONFIGURE_ARGS+=        --syslibdir=/usr/lib

pre-configure:
		cd ${WRKSRC} && ./bootstrap.sh

.include "../../mk/bsd.pkg.mk"
