# $NetBSD: Makefile,v 1.6 2020/02/20 13:22:56 cheusov Exp $
#

DISTNAME=	nbase-9.1.0.2
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=cheusov/}

MAINTAINER=	cheusov@NetBSD.org
HOMEPAGE=	https://github.com/cheusov/nbase
COMMENT=	NetBSD userlevel portable to other UNIX-like systems
LICENSE=	modified-bsd

GITHUB_PROJECT=	nbase
BUILD_DEPENDS+=	mk-configure>=0.37.0:../../devel/mk-configure

USE_LANGUAGES=		c
USE_TOOLS+=		lex byacc

CFLAGS+=	-static -fPIE -DTM_YEAR_BASE=1900 -I/use/share/mk-configure/features
LDFLAGS+=	-lterminfo

TEST_TARGET=		test

.include "../../devel/mk-configure/mk-c.mk"

MAKE_FLAGS+=	PREFIX=${PREFIX} \
		MANDIR=${PREFIX}/share/man

# -Wno-error=unused-result -Werror=strict-aliasing(libnbcompat,)
MAKE_FLAGS+=	WARNERR=no

.include "../../mk/curses.buildlink3.mk"
.include "../../archivers/bzip2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
