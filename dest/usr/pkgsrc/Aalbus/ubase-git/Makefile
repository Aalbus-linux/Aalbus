# $NetBSD: Makefile,v 1.2 2012/10/07 17:17:25 asau Exp $
#

DISTNAME=	ubase-${UBASE_VER}
CATEGORIES=	sysutils

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://core.suckless.org/ubase/
COMMENT=	Small and suckless Linux-specific unix utilities
LICENSE=	mit

NO_CHECKSUM=	yes

.include "../../mk/bsd.prefs.mk"

UBASE_VER!=	${DATE} +%Y%m%d


GIT_REPOSITORIES=	ubase
GIT_REPO.ubase=		git://git.suckless.org/ubase

WRKSRC=		${WRKDIR}/ubase

pre-configure:
		cp ./files/* ${WRKDIR}/ubase/


#remove files that conflict with shadow and netbsd-curses
post-install:
		rm ${DESTDIR}${PREFIX}/bin/lastlog
		rm ${DESTDIR}${PREFIX}/bin/passwd
		rm ${DESTDIR}${PREFIX}/share/man/man1/login.1
		rm ${DESTDIR}${PREFIX}/share/man/man1/passwd.1
		rm ${DESTDIR}${PREFIX}/share/man/man1/su.1
		rm ${DESTDIR}${PREFIX}/share/man/man8/lastlog.8
		rm ${DESTDIR}${PREFIX}/share/man/man8/nologin.8
		rm ${DESTDIR}${PREFIX}/bin/clear
		rm ${DESTDIR}${PREFIX}/share/man/man1/clear.1

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
