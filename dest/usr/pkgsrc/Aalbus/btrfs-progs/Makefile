# $NetBSD: Makefile,v 1.30 2020/03/20 11:58:21 nia Exp $

VERSION=	5.10
DISTNAME=	btrfs-progs-v$(VERSION)
PKGNAME=	btrfs-progs-$(VERSION)
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	https://mirrors.edge.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/
EXTRACT_SUFX=	.tar.gz

MAINTAINER=	staal1978@gmail.com
HOMEPAGE=	https://btrfs.wiki.kernel.org/index.php/Main_Page
COMMENT=	BTRFS  management programs
LICENSE=	gnu-gpl-v2

HAS_CONFIGURE= 	yes

USE_TOOLS+=	gmake

pre-configure:
	cp files/configure $(WRKSRC)/

post-configure:
	cp files/Makefile $(WRKSRC)/

CONFIGURE_ARGS+=	--with-crypto=libsodium
CONFIGURE_ARGS+=	--disable-documentation
CONFIGURE_ARGS+=	--disable-shared
CONFIGURE_ARGS+=	--enable-static
CONFIGURE_ARGS+=	--prefix=/usr
CONFIGURE_ARGS+=	--sysconfdir=/etc
#we have some weird issue with pkg-config and configure.
#same issue for both pkgconf and real pkg-config
CONFIGURE_ARGS+=        PKG_CONFIG="/usr/bin/pkg-config"
CONFIGURE_ARGS+=        ac_cv_path_PKG_CONFIG="/usr/bin/pkg-config"
CONFIGURE_ARGS+=	EXT2FS_LIBS="/usr/lib/libext2fs.a"
CONFIGURE_ARGS+=	EXT2FS_CFLAGS="-I/usr/include/ext2fs"
CONFIGURE_ARGS+=	COM_ERR_LIBS="/usr/lib/libcom_err.a"
CONFIGURE_ARGS+=	COM_ERR_CFLAGS="-I/usr/include"
CONFIGURE_ARGS+=	MOUNT_LIBS="/usr/lib/libmount.a"
CONFIGURE_ARGS+=	MOUNT_CFLAGS="-I/usr/include/libmount"
CONFIGURE_ARGS+=	ZLIB_LIBS="/usr/lib/libz.a"
CONFIGURE_ARGS+=	ZLIB_CFLAGS="-I/usr/include"
CONFIGURE_ARGS+=	ZSTD_LIBS="/usr/lib/libzstd.a"
CONFIGURE_ARGS+=	ZSTD_CFLAGS="-I/usr/include"

LDFLAGS+=	-static -lexecinfo -lext2fs -z muldefs
CFLAGS+=	-static -fno-lto -I/usr/include/uuid -I/usr/include/blkid -I/usr/include/ext2fs

.include "../../devel/libblkid/buildlink3.mk"
.include "../../devel/libuuid/buildlink3.mk"
.include "../../Aalbus/e2fsprogs/buildlink3.mk"
.include "../../devel/libexecinfo/buildlink3.mk"
.include "../../security/libsodium/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"


