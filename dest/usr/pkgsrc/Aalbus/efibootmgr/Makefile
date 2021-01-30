# $NetBSD: Makefile,v 1.12 2012/11/23 22:34:05 othyro Exp $

VERSION=		16
DISTNAME=		efibootmgr-$(VERSION)
CATEGORIES=		sysutils devel
MASTER_SITES=		https://github.com/rhboot/efibootmgr/releases/download/$(VERSION)/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		
COMMENT=		EFI boot manager for linux

ONLY_FOR_PLATFORM=	Linux-*-*

USE_TOOLS+=		gmake

CFLAGS+=		-I/usr/include/efivar
LDFLAGS+=		-lefivar -lefiboot -lintl -lpopt

MAKE_FLAGS+=		TOPDIR=$(WRKSRC) EFIDIR="/boot/EFI"

.include "../../mk/bsd.pkg.mk"
