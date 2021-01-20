# $NetBSD: Makefile,v 1.2 2012/10/07 17:17:25 asau Exp $
#

DISTNAME=		musl-compat-${_COMPAT_VER}
CATEGORIES=		sysutils

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		https://github.com/somasis/musl-compat
COMMENT=		Extra glibc compatibility for musl libc
LICENSE=		2-clause-bsd

NO_CHECKSUM=		yes

.include "../../mk/bsd.prefs.mk"

_COMPAT_VER!=		${DATE} +%Y%m%d


GIT_REPOSITORIES=	musl-compat
GIT_REPO.musl-compat=	git://github.com/somasis/musl-compat.git

WRKSRC=			${WRKDIR}/musl-compat

USE_TOOLS+=             gmake
MAKE_FLAGS+=		prefix=/usr 

#remove files that conflict with other packages
post-install:		
			rm ${DESTDIR}${PREFIX}/lib/libintl.a

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
