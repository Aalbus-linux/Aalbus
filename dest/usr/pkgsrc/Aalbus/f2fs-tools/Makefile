# $NetBSD: Makefile,v 1.30 2020/03/20 11:58:21 nia Exp $

DISTNAME=	f2fs-tools-1.14.0
PKGNAME=	$(DISTNAME)
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/
EXTRACT_SUFX=	.tar.gz

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/about/
COMMENT=	F2FS  management programs
LICENSE=	gnu-gpl-v2


USE_LANGUAGES=		c99
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake gm4 autoconf pkg-config
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
INSTALL_TARGET=		install install-libs

PLIST_VARS+=		shlib
PLIST.shlib=		yes

CONFIGURE_ARGS+=	--enable-fsck
CONFIGURE_ARGS+=	--without-selinux
CONFIGURE_ARGS+=	PKG_CONFIG="/usr/bin/pkg-config"
CONFIGURE_ARGS+=	ac_cv_path_PKG_CONFIG="/usr/bin/pkg-config"

#doing this manually right now because I have some weird issues getting it to work
#pre-configure:
#	cd $(WRKSRC) && M4=/usr/gnu/bin/m4 ./autogen.sh


.include "../../devel/libblkid/buildlink3.mk"
.include "../../devel/libuuid/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"


