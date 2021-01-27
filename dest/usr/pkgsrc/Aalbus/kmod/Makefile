# $NetBSD: Makefile,v 1.30 2020/03/20 11:58:21 nia Exp $

DISTNAME=	kmod-28
PKGNAME=	$(DISTNAME)
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://mirrors.edge.kernel.org/pub/linux/utils/kernel/kmod/
EXTRACT_SUFX=	.tar.gz

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://www.linux.org/docs/man8/kmod.html
COMMENT=	kernel module management libraries and programs
LICENSE=	gnu-gpl-v2


USE_LANGUAGES=		c99
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--disable-static
CONFIGURE_ENV+=		can_build_shared=yes enable_shared=yes enable_static=no

.include "../../mk/bsd.pkg.mk"


