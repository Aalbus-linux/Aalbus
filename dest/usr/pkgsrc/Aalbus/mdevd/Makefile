# $NetBSD$

DISTNAME=	mdevd-0.1.3.0
CATEGORIES=	sysutils
MASTER_SITES=	http://skarnet.org/software/mdevd/

MAINTAINER=	cfkoch@edgebsd.org
HOMEPAGE=	http://skarnet.org/software/mdev/
COMMENT=	The skarned udev/mdev replacement
LICENSE=	isc

USE_TOOLS+=		gmake
HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-sysdeps=${PREFIX}/lib/skalibs/sysdeps
CONFIGURE_ARGS+=	--with-lib=${PREFIX}/lib/execline
CONFIGURE_ARGS+=	--with-lib=${PREFIX}/lib/skalibs
CONFIGURE_ARGS+=	--with-include=${PREFIX}/include

.include "../../Aalbus/skalibs/buildlink3.mk"
.include "../../Aalbus/execline/buildlink3.mk"
# .include "../../Aalbus/s6/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
