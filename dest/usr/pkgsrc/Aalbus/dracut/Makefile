# $NetBSD$

DISTNAME=	dracut-051
CATEGORIES=	sysutils
MASTER_SITES=	https://mirrors.edge.kernel.org/pub/linux/utils/boot/dracut/

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://dracut.wiki.kernel.org/index.php/Main_Page
COMMENT=	Initramfs utility
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	gmake

LDFLAGS+=	-lfts -lkmod

pre-configure:
	touch $(WRKSRC)/Makefile.inc
	sed -i s'/-arx/-aR/g' $(WRKSRC)/Makefile

.include "../../mk/bsd.pkg.mk"
