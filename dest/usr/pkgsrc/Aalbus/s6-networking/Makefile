# $NetBSD$

DISTNAME=	s6-networking-2.4.0.0
CATEGORIES=	sysutils
MASTER_SITES=	http://skarnet.org/software/s6-networking/

MAINTAINER=	cfkoch@edgebsd.org
HOMEPAGE=	http://skarnet.org/software/s6-networking/
COMMENT=	The s6 networking suite
LICENSE=	isc

USE_TOOLS+=		gmake
HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-sysdeps=${PREFIX}/lib/skalibs/sysdeps
CONFIGURE_ARGS+=	--with-lib=${PREFIX}/lib/execline
CONFIGURE_ARGS+=	--with-lib=${PREFIX}/lib/skalibs
CONFIGURE_ARGS+=	--with-lib=$(PREFIX)/lib/s6-dns
CONFIGURE_ARGS+=	--with-include=${PREFIX}/include
CONFIGURE_ARGS+=	--disable-shared
CONFIGURE_ARGS+=	--enable-static

.include "../../Aalbus/skalibs/buildlink3.mk"
.include "../../Aalbus/execline/buildlink3.mk"
.include "../../Aalbus/s6-dns/buildlink3.mk"
#.include "../../security/bearssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
