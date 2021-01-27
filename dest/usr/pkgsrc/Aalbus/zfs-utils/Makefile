# $NetBSD: Makefile,v 1.30 2020/03/20 11:58:21 nia Exp $

VERSION=	2.0.1
DISTNAME=	zfs-$(VERSION)
PKGNAME=	zfs-utils-$(VERSION)
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/openzfs/zfs/releases/download/zfs-$(VERSION)/
EXTRACT_SUFX=	.tar.gz

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://openzfs.org/
COMMENT=	ZFS  management programs
LICENSE=	cddl-1.0


USE_LANGUAGES=		c99
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake gm4 gsed pkg-config libtool
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-config=user
CONFIGURE_ARGS+=	SED=/usr/gnu/bin/sed

MAKE_FLAGS=		RM="rm -f"

CFLAGS+=		-I/usr/include/tirpc

INSTALL_TARGET=		install


.include "../../devel/libblkid/buildlink3.mk"
.include "../../devel/libuuid/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"


