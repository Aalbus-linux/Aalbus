# $NetBSD: Makefile,v 1.2 2019/08/06 11:13:07 gdt Exp $

VERSION=	1.3.1
DISTNAME=	libtirpc-${VERSION}
PKGNAME=	${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	https://downloads.sourceforge.net/libtirpc/
EXTRACT_SUFX=	.tar.bz2
MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	
COMMENT=	RPC library
LICENSE=	2-clause-bsd

USE_TOOLS+=             gmake
GNU_CONFIGURE=          yes

.include "../../security/heimdal/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
