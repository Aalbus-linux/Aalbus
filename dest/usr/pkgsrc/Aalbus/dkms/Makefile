# $NetBSD: Makefile,v 1.12 2012/11/23 22:34:05 othyro Exp $

VERSION=		2.8.4
DISTNAME=		v$(VERSION)
PKGNAME=		dkms-$(VERSION)
CATEGORIES=		sysutils devel
MASTER_SITES=		https://github.com/dell/dkms/archive/
EXTRACT_SUFX=		.tar.gz

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		
COMMENT=		kernel module manager for linux

ONLY_FOR_PLATFORM=	Linux-*-*

WRKSRC=			$(WRKDIR)/$(PKGNAME)

pre-build:
	sed -i s'/all: clean tarball rpm debs/all: clean/g' $(WRKSRC)/Makefile
	sed -i s'/--reference=dkms.8//g' $(WRKSRC)/Makefile

USE_TOOLS+=		gmake
MAKE_FLAGS+=		TOPDIR=$(WRKSRC) BUILDDIR=$(WRKSRC) SHELL=/usr/bin/mksh

.include "../../mk/bsd.pkg.mk"
