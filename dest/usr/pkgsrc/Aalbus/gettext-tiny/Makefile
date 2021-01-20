# $NetBSD: Makefile,v 1.2 2019/08/06 11:13:07 gdt Exp $

VERSION=	0.3.1

PKGNAME=	gettext-tiny-${VERSION}
DISTNAME=       ${PKGNAME}

CATEGORIES=	devel
MASTER_SITES=	http://ftp.barfooze.de/pub/sabotage/tarballs/
EXTRACT_SUFX=	.tar.xz
MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://github.com/sabotage-linux/gettext-tiny
COMMENT=	Small liberally licensed alternative to GNU gettext
LICENSE=	mit

WRKSRC=		${WRKDIR}/${PKGNAME}

USE_TOOLS+=             gmake

MAKE_FLAGS+=	LIBINTL=musl
MAKE_FLAGS+=	prefix=/usr
MAKE_FLAGS+=	sysconfdir=/etc
MAKE_FLAGS+=	CFLAGS+="-D_GNU_SOURCE"

.include "../../mk/bsd.pkg.mk"
