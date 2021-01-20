# $NetBSD: Makefile,v 1.2 2012/10/07 17:17:25 asau Exp $
#

DISTNAME=		libdrpc-${_COMPAT_VER}
CATEGORIES=		devel

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		https://github.com/idunham/libdrpc
COMMENT=		RPC functions ported from Android
LICENSE=		apache-2.0

NO_CHECKSUM=		yes

.include "../../mk/bsd.prefs.mk"

_COMPAT_VER!=		${DATE} +%Y%m%d


GIT_REPOSITORIES=	libdrpc
GIT_REPO.libdrpc=	git://github.com/idunham/libdrpc.git
WRKSRC=			${WRKDIR}/libdrpc

CFLAGS+=-D_BSD_SOURCE -D_XOPEN_SOURCE=600 -I. -I./rpc -DRPC_OFFSET=0

USE_TOOLS+=             gmake
MAKE_FLAGS+=		PREFIX=/usr 
MAKE_FLAGS+=		INCDIR=/usr/include
MAKE_FLAGS+=		CC=clang

pre-build:
		cp files/types.h ${WRKSRC}/rpc/

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
