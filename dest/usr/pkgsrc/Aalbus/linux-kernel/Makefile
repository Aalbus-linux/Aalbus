# $NetBSD: Makefile,v 1.8 2012/10/03 09:10:41 asau Exp $

.include "Makefile.common"

# The naming scheme allows it to be installed multiple times simultaneously
PKGNAME=	linux-kernel${LINUX_VERSION}-${LINUX_VERSION}
COMMENT=	The Linux kernel
LICENSE=	gnu-gpl-v2

# BUILD_DEPENDS+=	kmod
# replaced by kmod
#BUILD_DEPENDS+=		linux-module-init-tools-[0-9]*:../../wip/linux-module-init-tools
# This means that old linux-modutils aren't available for other kernel
#BUILD_DEPENDS+=	linux-modutils-[0-9]*:../../wip/linux-modutils

# Don't let the Linux kernel get accidently deinstalled.
# XXX todo: fix pkg_info to not be so noisy about this
# XXX       maybe say "Package preserve option is set" or ...?
PKG_PRESERVE=	# defined


.include "../../mk/bsd.prefs.mk"

# Location of where boot/ and lib/modules directories are located.
# XXX do not use this yet
LINUXBASE?=	${PREFIX}
# XXX can not  set LOCALBASE because
#  PREFIX is used in patch for depmod
#  PKG_TOOLS_BIN is changed
#LOCALBASE=	/

NO_MTREE=	YES

USE_TOOLS+=	gmake gm4 gsed

PLIST_SUBST+=		LINUXBASE=${LINUXBASE:Q}
MESSAGE_SUBST+=		PKGBASE=${PKGBASE}

CFLAGS+=	-fno-lto

MAKE_FLAGS+=	M4=/usr/gnu/bin/m4
MAKE_FLAGS+=	SED=/usr/gnu/bin/sed
MAKE_FLAGS+=	CC=clang HOSTCC=clang
MAKE_FLAGS+=	LLVM_IAS=1 CLANG_VERSION=120000

MAKE_DIRS+=	${LINUXBASE}/lib/modules
MAKE_DIRS+=	${LINUXBASE}/boot

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} bzImage && \
	${SETENV} ${MAKE_ENV} ${GMAKE} modules

do-install:
	${INSTALL_DATA_DIR} ${LINUXBASE}/boot
	${CP} ${WRKSRC}/arch/${LOWER_ARCH}/boot/bzImage \
		${LINUXBASE}/boot/bzImage-${LINUX_VERSION}
	${CP} ${WRKSRC}/System.map \
		${LINUXBASE}/boot/System.map-${LINUX_VERSION}
	${INSTALL_DATA} ${WRKSRC}/.config ${PREFIX}/boot/${PKGNAME}.config
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} modules_install

.include "../../mk/bsd.pkg.mk"
