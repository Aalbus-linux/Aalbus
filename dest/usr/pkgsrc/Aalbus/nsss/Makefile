# $NetBSD$

DISTNAME=	nsss-0.1.0.0
CATEGORIES=	sysutils
MASTER_SITES=	http://skarnet.org/software/nsss/

MAINTAINER=	cfkoch@edgebsd.org
HOMEPAGE=	http://skarnet.org/software/nsss/
COMMENT=	skarnet nss replacement
LICENSE=	isc

USE_TOOLS+=		gmake
HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-sysdeps=${PREFIX}/lib/skalibs/sysdeps
CONFIGURE_ARGS+=	--with-lib=${PREFIX}/lib/execline
CONFIGURE_ARGS+=	--with-lib=${PREFIX}/lib/skalibs
CONFIGURE_ARGS+=	--with-include=${PREFIX}/include
CONFIGURE_ARGS+=	--disable-shared

.include "../../Aalbus/skalibs/buildlink3.mk"
.include "../../Aalbus/execline/buildlink3.mk"
# .include "../../Aalbus/s6/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
