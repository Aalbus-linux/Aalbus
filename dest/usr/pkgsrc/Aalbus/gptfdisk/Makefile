# $NetBSD: Makefile,v 1.12 2012/11/23 22:34:05 othyro Exp $

DISTNAME=		gptfdisk-1.0.4
CATEGORIES=		sysutils 
MASTER_SITES=		https://downloads.sourceforge.net/project/gptfdisk/gptfdisk/1.0.4/

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		https://www.rodsbooks.com/gdisk/
COMMENT=		A text-mode partitioning tool that works on GUID Partition Table (GPT) disks

USE_LANGUAGES=		c++
USE_TOOLS+=             gmake

WRKSRC=			${WRKDIR}/${DISTNAME}

LDFLAGS+=		-lintl

pre-build:
		cp ./files/Makefile ${WRKSRC}/

post-install:
		mkdir -p ${DESTDIR}${PREFIX}/bin
		cp ${WRKSRC}/gdisk ${DESTDIR}${PREFIX}/bin/
		cp ${WRKSRC}/cgdisk ${DESTDIR}${PREFIX}/bin/
		cp ${WRKSRC}/sgdisk ${DESTDIR}${PREFIX}/bin/
		cp ${WRKSRC}/fixparts ${DESTDIR}${PREFIX}/bin/
		mkdir -p ${DESTDIR}${PREFIX}/share/man/man8
		cp ${WRKSRC}/*.8 ${DESTDIR}${PREFIX}/share/man/man8/

.include "../../mk/bsd.pkg.mk"
.include "../../devel/popt/buildlink3.mk"
