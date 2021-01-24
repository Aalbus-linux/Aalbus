# $NetBSD: Makefile,v 1.15 2017/11/26 10:55:14 wiz Exp $

DISTNAME=	xfsprogs-5.10.0
PKGNAME=	${DISTNAME}
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://mirrors.edge.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://xfs.org/index.php/Main_Page
COMMENT=	XFS filesystem manipulation utilities

GNU_CONFIGURE=	no
USE_TOOLS+=	gmake autoconf msgmerge
USE_LIBTOOL=	yes

CONFIGURE_ARGS+=	--enable-editline
CONFIGURE_ARGS+=	--sbindir=/usr/sbin
CONFIGURE_ENV+=		INSTALL_USER=${ROOT_USER} INSTALL_GROUP=${ROOT_GROUP}
CONFIGURE_ENV+=		MSGFMT=${TOOLS_PATH.msgfmt:Q}
CONFIGURE_ENV+=		MSGMERGE=${TOOLS_PATH.msgmerge:Q}

INSTALL_SH_OVERRIDE=	no

LDFLAGS+=		-lintl

INSTALL_MAKE_FLAGS+=	PREFIX=/usr \
			PKG_MAN_DIR=/usr/share/man \
			PKG_ROOT_SBINDIR=/usr/sbin \
			PKG_INC_DIR=/usr/include \
			PKG_LIB_DIR=/usr/lib

WRKSRC=		${WRKDIR}/${PKGNAME_NOREV}
BUILD_TARGET=

#fix annoying/weird bug
post-install:
	mv &(DESTDIR)/sbin/* $(DESTDIR)/$(PREFIX)/sbin/

.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/readline.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
