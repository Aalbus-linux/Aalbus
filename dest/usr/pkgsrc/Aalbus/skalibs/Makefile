# $NetBSD: Makefile,v 1.4 2019/06/20 00:56:58 schmonz Exp $

DISTNAME=		skalibs-2.10.0.1
CATEGORIES=		devel
MASTER_SITES=		http://skarnet.org/software/skalibs/

MAINTAINER=		cfkoch@edgebsd.org
HOMEPAGE=		http://skarnet.org/software/skalibs/
COMMENT=		The skarnet.org C system programming library
LICENSE=		isc

USE_LANGUAGES=		c
HAS_CONFIGURE=		yes
USE_TOOLS+=		gmake

CONFIGURE_ARGS+=	--prefix=${PREFIX:Q}
CONFIGURE_ARGS+=	"--disable-shared"

.include "../../mk/bsd.pkg.mk"
