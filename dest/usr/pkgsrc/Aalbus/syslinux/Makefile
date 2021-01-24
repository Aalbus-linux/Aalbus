# $NetBSD: Makefile,v 1.4 2019/06/20 00:56:58 schmonz Exp $

DISTNAME=		syslinux-6.04-pre1
CATEGORIES=		devel
MASTER_SITES=		https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/Testing/6.04/

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		https://wiki.syslinux.org/wiki/index.php?title=The_Syslinux_Project
COMMENT=		syslinux boot manager
LICENSE=		gnu-gpl-v2

USE_LANGUAGES=		c
USE_TOOLS+=		gmake perl

LDFLAGS=		

MAKE_FLAGS+=		CC=clang
MAKE_FLAGS+=		efi64

.include "../../mk/bsd.pkg.mk"
