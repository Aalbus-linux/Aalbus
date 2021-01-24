# $NetBSD: Makefile,v 1.6 2019/04/04 07:34:07 bsiegert Exp $

.include "../../devel/libuuid/Makefile.common"

PKGNAME=	${DISTNAME:S/util-linux/libmount/}
PKGREVISION=	1
CATEGORIES=	devel
COMMENT=	Library to read mount info etc
LICENSE=	gnu-lgpl-v2.1

CONFIGURE_ARGS+=	--enable-libblkid
CONFIGURE_ARGS+=	--enable-libmount
PKGCONFIG_OVERRIDE+=	libmount/mount.pc.in

post-install:
	rm ${DESTDIR}${PREFIX}/include/blkid/blkid.h
	rm ${DESTDIR}${PREFIX}/lib/libblkid.la
	rm ${DESTDIR}${PREFIX}/lib/libblkid.a
	rm ${DESTDIR}${PREFIX}/lib/pkgconfig/blkid.pc
	rm ${DESTDIR}${PREFIX}/share/man/man3/libblkid.3

.include "../../devel/libuuid/buildlink3.mk"
.include "../../devel/libblkid/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
