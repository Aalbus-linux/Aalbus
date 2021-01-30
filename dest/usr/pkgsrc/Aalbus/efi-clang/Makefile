# $NetBSD: Makefile,v 1.2 2012/10/07 17:17:25 asau Exp $
#

DISTNAME=		efi-clang-${_COMPAT_VER}
CATEGORIES=		devel

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		
COMMENT=		EFI libraries 
LICENSE=		mit

NO_CHECKSUM=		yes

.include "../../mk/bsd.prefs.mk"

_COMPAT_VER!=		${DATE} +%Y%m%d

GIT_REPOSITORIES=	efi-clang
GIT_REPO.efi-clang=	git://github.com/yoppeh/efi.git
WRKSRC=			${WRKDIR}/efi-clang

do-build:
	#nothing...

do-install:
	mkdir -p $(DESTDIR)/usr/{bin,include/efi}
	cp $(WRKSRC)/*.h $(DESTDIR)/usr/include/efi/
	cp -r $(WRKSRC)/protocol $(DESTDIR)/usr/include/efi/
	cp files/*.inc $(DESTDIR)/usr/include/efi/
	cp files/clang-efi $(DESTDIR)/usr/bin/
	cp files/ld-efi $(DESTDIR)/usr/bin/
	chmod +x $(DESTDIR)/usr/bin/*

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
