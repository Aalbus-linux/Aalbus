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

PLIST_SUBST+=		LINUXBASE=${LINUXBASE:Q}
MESSAGE_SUBST+=		PKGBASE=${PKGBASE}

MAKE_FLAGS+=	LLVM=1 LLVM_IAS=1
MAKE_FLAGS+=	KCFLAGS="-I/usr/lib/clang/12.0.0/include"

MAKE_DIRS+=	${LINUXBASE}/lib/modules
MAKE_DIRS+=	${LINUXBASE}/boot

MAKE_ENV+=	PATH="/usr/gnu/bin:$(PATH)"

pre-build:
	cp /usr/lib/clang/12.0.0/include/stdarg.h $(WRKSRC)/include/
	sed -i 's|firmware/efi/libstub/lib.a|firmware/efi/libstub/lib.a /usr/lib/libssp-stub.a|g' $(WRKSRC)/arch/x86/boot/compressed/Makefile

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} $(MAKE_FLAGS) bzImage && \
	${SETENV} ${MAKE_ENV} ${GMAKE} $(MAKE_FLAGS) modules

do-install:
	${INSTALL_DATA_DIR} ${LINUXBASE}/boot
	${CP} ${WRKSRC}/arch/${LOWER_ARCH}/boot/bzImage \
		${LINUXBASE}/boot/bzImage-${LINUX_VERSION}
	${CP} ${WRKSRC}/System.map \
		${LINUXBASE}/boot/System.map-${LINUX_VERSION}
	${INSTALL_DATA} ${WRKSRC}/.config ${PREFIX}/boot/${PKGNAME}.config
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} modules_install

.include "../../mk/bsd.pkg.mk"
