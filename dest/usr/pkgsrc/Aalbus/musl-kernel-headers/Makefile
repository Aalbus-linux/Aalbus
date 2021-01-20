# $NetBSD: Makefile,v 1.2 2012/10/07 17:17:25 asau Exp $
#

DISTNAME=		musl-kernel-headers-${_COMPAT_VER}
CATEGORIES=		devel

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		https://github.com/sabotage-linux/kernel-headers
COMMENT=		Kernel headers sanitized for musl libc
LICENSE=		gnu-gpl-v2

NO_CHECKSUM=		yes

.include "../../mk/bsd.prefs.mk"

_COMPAT_VER!=		${DATE} +%Y%m%d


GIT_REPOSITORIES=		kernel-headers
GIT_REPO.kernel-headers=	git://github.com/sabotage-linux/kernel-headers.git
WRKSRC=				${WRKDIR}/kernel-headers

USE_TOOLS+=             gmake
MAKE_FLAGS+=		prefix=/usr 
MAKE_FLAGS+=		ARCH=x86_64

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
