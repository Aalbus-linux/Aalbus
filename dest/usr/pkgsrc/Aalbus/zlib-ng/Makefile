# $NetBSD: Makefile,v 1.56 2020/01/26 17:31:05 rillig Exp $


DISTNAME=	2.0.5
PKGNAME=	zlib-$(DISTNAME)
CATEGORIES=	devel
MASTER_SITES=	https://github.com/zlib-ng/zlib-ng/archive/refs/tags/

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://github.com/zlib-ng/zlib-ng
COMMENT=	General purpose data compression library, fork
LICENSE=	zlib

USE_LIBTOOL=		yes

WRKSRC=			$(WRKDIR)/zlib-ng-$(DISTNAME)

USE_TOOLS+=		gmake

HAS_CONFIGURE=		yes
CONFIGURE_ARGS+=	--prefix=/usr
CONFIGURE_ARGS+=	--zlib-compat

CFLAGS+=		${CPPFLAGS}
CFLAGS+=		-fPIC
LDFLAGS.Cygwin=		-no-undefined

.include "../../mk/bsd.prefs.mk"

SUBST_CLASSES+=		pc
SUBST_MESSAGE.pc=	pkg-config file substitutions
SUBST_STAGE.pc=		pre-configure
SUBST_FILES.pc=		zlib.pc.in
SUBST_SED.pc=		-e "s,@prefix@,${PREFIX},g"
SUBST_SED.pc+=		-e "s,@exec_prefix@,${PREFIX},g"
SUBST_SED.pc+=		-e "s,@VERSION@,${PKGVERSION_NOREV},g"
SUBST_SED.pc+=		-e "s,@includedir@,${PREFIX}/include,g"
SUBST_SED.pc+=		-e "s,@libdir@,${PREFIX}/lib,g"
SUBST_SED.pc+=		-e "s,@sharedlibdir@,${PREFIX}/lib,g"

INSTALLATION_DIRS=	include lib/pkgconfig ${PKGMANDIR}/man3

.include "../../mk/bsd.pkg.mk"
