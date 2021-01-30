# $NetBSD: Makefile,v 1.2 2012/10/07 17:17:25 asau Exp $
#

DISTNAME=		gnu-efi-${_COMPAT_VER}
CATEGORIES=		devel

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		
COMMENT=		EFI libraries 
LICENSE=		modified-bsd

NO_CHECKSUM=		yes

USE_TOOLS+=		gmake

.include "../../mk/bsd.prefs.mk"

_COMPAT_VER!=		${DATE} +%Y%m%d

GIT_REPOSITORIES=	gnu-efi
GIT_REPO.gnu-efi=	git://git.code.sf.net/p/gnu-efi/code
WRKSRC=			${WRKDIR}/gnu-efi

pre-build:
	sed -i s'/)gcc/)clang/g' $(WRKSRC)/Make.defaults
	sed -i s'/-maccumulate-outgoing-args //g' $(WRKSRC)/Make.defaults

do-build:
	gmake -C $(WRKSRC)/lib
	gmake -C $(WRKSRC)/gnuefi
	gmake -C $(WRKSRC)/inc

# not critical atm, but something I want to fix later...
#	LDFLAGS="" gmake -C $(WRKSRC)/apps

do-install:
	gmake INSTALLROOT=$(DESTDIR) PREFIX=/usr -C $(WRKSRC)/lib install
	gmake INSTALLROOT=$(DESTDIR) PREFIX=/usr -C $(WRKSRC)/gnuefi install
	gmake INSTALLROOT=$(DESTDIR) PREFIX=/usr -C $(WRKSRC)/inc install

# when apps have been fixed	
#	mkdir -p $(DESTDIR)/usr/share/gnu-efi/apps
#	cp $(WRKSRC)/apps/*.efi $(DESTDIR)/usr/share/gnu-efi/apps/

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
