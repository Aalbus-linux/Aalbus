# $NetBSD: Makefile,v 1.17 2020/03/20 11:57:26 nia Exp $

DISTNAME=	elftoolchain-svn-0
CATEGORIES=	devel

MAINTAINER=	agc@NetBSD.org
HOMEPAGE=	http://elftoolchain.sourceforge.net/
COMMENT=	Compilation tools (nm, ar, as, ld, etc.) for the ELF object format
LICENSE=	modified-bsd

CONFLICTS=	libelf-[0-9]*

SVN_REPO=       svn://svn.code.sf.net/p/elftoolchain/code/trunk

NOT_FOR_PLATFORM=	Darwin-*-*

MAKE_JOBS_SAFE=	no

USE_BSD_MAKEFILE=	yes
USE_TOOLS+=		m4 lex
MAKE_ENV+=		${BSD_MAKE_ENV}
MAKE_FLAGS+=		MKPROFILE=yes
MAKE_FLAGS+=		INCSDIR=${PREFIX}/include
MAKE_FLAGS+=		CWARNFLAGS=${CWARNFLAGS:Q}

INSTALLATION_DIRS=	bin include lib
INSTALLATION_DIRS+=	${PKGMANDIR}/man1 ${PKGMANDIR}/cat1 ${PKGMANDIR}/html1
INSTALLATION_DIRS+=	${PKGMANDIR}/man3 ${PKGMANDIR}/cat3 ${PKGMANDIR}/html3
INSTALLATION_DIRS+=	${PKGMANDIR}/man5 ${PKGMANDIR}/cat5 ${PKGMANDIR}/html5

BUILDLINK_TRANSFORM+=	rm:-Werror

pre-build:
	cp files/mk/* $(WRKSRC)/mk/
	rm -rf $(WRKSRC)/test


MAKE_FLAGS+=		WITH_ISA=yes

INSTALL_MAKE_FLAGS+=	RANLIB=$(WRKSRC)/ar/ranlib

#remove files conflicting with llvm tools
post-install:
	                rm -rf ${DESTDIR}${PREFIX}/bin
			rm -rf $(DESTDIR)$(PREFIX)/share/man/man1

.include "../../wip/mk/svn-package.mk"
.include "../../mk/bsd.pkg.mk"
