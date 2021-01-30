# $NetBSD: Makefile,v 1.14 2020/03/22 12:24:58 rillig Exp $
#

DISTNAME=	acpica-unix-20210105
PKGNAME=	${DISTNAME:S/-unix-/-utils-/}
PKGREVISION=	1
CATEGORIES=	sysutils devel
MASTER_SITES=	https://acpica.org/sites/acpica/files/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.acpica.org/
COMMENT=	Intel ACPI CA Unix utilities
LICENSE=	modified-bsd OR gnu-gpl-v2

TESTS_DISTNAME=	${DISTNAME:S/acpica-unix-/acpitests-unix-/}
DISTFILES=	${DEFAULT_DISTFILES}
DISTFILES+=	${TESTS_DISTNAME}${EXTRACT_SUFX}

USE_TOOLS+=	bison flex gm4 gmake

post-extract:
	${RUN}rm -rf ${WRKSRC}/tests
	${RUN}mv ${WRKDIR}/${TESTS_DISTNAME}/tests ${WRKSRC}
	sed -i s'/-Werror//g' $(WRKSRC)/generate/unix/Makefil*
	sed -i s'/-Wlogical-op//g' $(WRKSRC)/generate/unix/Makefil*
	sed -i s'/-Wold-style-declaration//g' $(WRKSRC)/generate/unix/Makefil*
	sed -i s'/-Wmissing-parameter-type//g' $(WRKSRC)/generate/unix/Makefil*
	

MAKE_FLAGS+=	M4=/usr/gnu/bin/m4

do-test:
# ACPICA Tests rely on non-zero exit
## ASL tests
	cd ${WRKSRC}/tests && ./aslts.sh -u
## API tests
	cd ${WRKSRC}/tests/aapits && gmake
	cd ${WRKSRC}/tests/aapits/asl && \
	ASL=${WRKSRC}/generate/unix/bin/iasl gmake
# This one needs to be fixed
#	cd ${WRKSRC}/tests/aapits/bin && ./aapitsrun
## Template tests
# This test is broken too
#	cd ${WRKSRC}/tests/templates && gmake

.include "../../mk/compiler.mk"

.if !empty(CC_VERSION:Mgcc-[89]*)
CFLAGS+=	-Wno-error=format-truncation
.endif

.include "../../mk/bsd.pkg.mk"
