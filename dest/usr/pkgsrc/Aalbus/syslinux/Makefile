# $NetBSD: Makefile,v 1.4 2019/06/20 00:56:58 schmonz Exp $

VERSION=		6.04-pre1
#VERSION=		6.03
DISTNAME=		syslinux-$(VERSION)
CATEGORIES=		devel
MASTER_SITES=		https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/Testing/6.04/
#MASTER_SITES=		https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		https://wiki.syslinux.org/wiki/index.php?title=The_Syslinux_Project
COMMENT=		syslinux boot manager
LICENSE=		gnu-gpl-v2

USE_LANGUAGES=		c
USE_TOOLS+=		gmake perl

WRKSRC=         ${WRKDIR}/${PKGNAME}

pre-configure:
		sed -i s'/-nostdinc //g' $(WRKSRC)/mk/*.mk
		sed -i s'/-nostdlib //g' $(WRKSRC)/mk/*.mk
		sed -i s'/--print-libgcc/-print-libgcc-file-name/g' $(WRKSRC)/mk/*.mk
		sed -i s'|-lgnuefi -lefi|-lgnuefi -lefi /usr/lib/libssp-bionic.a /usr/lib/libc.a|g' $(WRKSRC)/efi/Makefile
		sed -i s'/__uint64_t/uint64_t/g' $(WRKSRC)/efi/wrapper.*
		sed -i s'/__uint32_t/uint32_t/g' $(WRKSRC)/efi/wrapper.*
		sed -i s'/__uint16_t/uint16_t/g' $(WRKSRC)/efi/wrapper.*
		sed -i s'/__uint8_t/unsigned char/g' $(WRKSRC)/efi/wrapper.*
		sed -i s'/(TARGETS)/(MAN_DOCS)/g' $(WRKSRC)/txt/Makefile
		cp files/embedded.mk $(WRKSRC)/mk/
		cp files/loadlib.c $(WRKSRC)/com32/lua/src/
		rm -rf $(WRKSRC)/win*

MAKE_FLAGS+=		CC="clang" LIBS="/usr/lib/libssp-bionic.a /usr/lib/libc.a"
MAKE_FLAGS+=		efi64 ARCH=x86_64 
MAKE_FLAGS+=		PYTHON=python3 -i -k

MAKE_INSTALL_FLAGS+=	efi64 INSTALLROOT=$(DESTDIR) SBINDIR=/usr/sbin MANDIR=/usr/share/man AUXDIR=/usr/lib/syslinux
MAKE_INSTALL_FLAGS+=	install

.include "../../mk/bsd.pkg.mk"
