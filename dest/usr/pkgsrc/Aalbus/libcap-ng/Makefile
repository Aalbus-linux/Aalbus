# $NetBSD: Makefile,v 1.4 2020/08/31 18:11:28 wiz Exp $

VERSION=	0.8.2
DISTNAME=	v$(VERSION)
PKGNAME=	libcap-ng-$(VERSION)
WRKSRC=		${WRKDIR}/libcap-ng-$(VERSION)
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/stevegrubb/libcap-ng/archive/

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://people.redhat.com/sgrubb/libcap-ng/
COMMENT=	Library for getting and setting POSIX.1e capabilities
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	pkg-config libtool autoconf gmake perl

ONLY_FOR_PLATFORM=	Linux-*-*

# do this manually for now. No idea why it does not work...
#pre-configure:
#	cd $(WRKSRC) && M4=/usr/gnu/bin/m4 ./autogen.sh

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--prefix=/usr
CONFIGURE_ARGS+=	--sysconfdir=/etc
CONFIGURE_ARGS+=	--without-python
CONFIGURE_ARGS+=	--without-python3


.include "../../mk/bsd.pkg.mk"
