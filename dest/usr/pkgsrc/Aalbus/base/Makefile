# $NetBSD$
#
# Aalbus "base" metapackage: the default runtime system.
# Installing this package (via pkgin) yields a bootable, networked,
# GNU-free system with a package manager. It deliberately contains no
# compiler and no build tools; those live in base-devel.

DISTNAME=	base-0.1
PKGNAME=	${DISTNAME}
CATEGORIES=	meta-pkgs
MAINTAINER=	TODO-set-maintainer@example.invalid
HOMEPAGE=	https://github.com/Aalbus-linux/Aalbus
COMMENT=	Aalbus GNU-free base system (runtime)
LICENSE=	isc

META_PACKAGE=	yes

# --- C library, kernel interface, init and device handling -------------
DEPENDS+=	musl-[0-9]*:../../Aalbus/musl
DEPENDS+=	musl-fts-[0-9]*:../../Aalbus/musl-fts
DEPENDS+=	nsss-[0-9]*:../../Aalbus/nsss
DEPENDS+=	skalibs-[0-9]*:../../Aalbus/skalibs
DEPENDS+=	execline-[0-9]*:../../Aalbus/execline
DEPENDS+=	s6-[0-9]*:../../Aalbus/s6
DEPENDS+=	s6-rc-[0-9]*:../../Aalbus/s6-rc
DEPENDS+=	s6-linux-init-[0-9]*:../../Aalbus/s6-linux-init
DEPENDS+=	s6-dns-[0-9]*:../../Aalbus/s6-dns
DEPENDS+=	s6-networking-[0-9]*:../../Aalbus/s6-networking
DEPENDS+=	utmps-[0-9]*:../../Aalbus/utmps
DEPENDS+=	mdevd-[0-9]*:../../Aalbus/mdevd

# --- Userland (BSD / suckless / Alpine-free) ---------------------------
DEPENDS+=	nbase-[0-9]*:../../Aalbus/nbase
DEPENDS+=	ubase-git-[0-9]*:../../Aalbus/ubase-git
DEPENDS+=	mksh-[0-9]*:../../Aalbus/mksh
DEPENDS+=	heirloom-doctools-[0-9]*:../../Aalbus/heirloom-doctools
DEPENDS+=	netbsd-curses-[0-9]*:../../Aalbus/netbsd-curses
DEPENDS+=	libcap-ng-[0-9]*:../../Aalbus/libcap-ng
DEPENDS+=	shadow-[0-9]*:../../Aalbus/shadow
DEPENDS+=	zlib-ng-[0-9]*:../../Aalbus/zlib-ng
DEPENDS+=	attr-[0-9]*:../../Aalbus/attr
DEPENDS+=	acl-[0-9]*:../../Aalbus/acl

# --- Filesystems and boot -----------------------------------------------
DEPENDS+=	e2fsprogs-[0-9]*:../../Aalbus/e2fsprogs
DEPENDS+=	dosfstools-[0-9]*:../../filesystems/dosfstools
DEPENDS+=	gptfdisk-[0-9]*:../../Aalbus/gptfdisk
DEPENDS+=	efibootmgr-[0-9]*:../../Aalbus/efibootmgr
DEPENDS+=	dracut-[0-9]*:../../Aalbus/dracut

# --- Package management (pkgsrc binary side) ---------------------------
DEPENDS+=	pkgin-[0-9]*:../../pkgtools/pkgin
DEPENDS+=	pkg_install-[0-9]*:../../pkgtools/pkg_install

# --- Networking and remote access --------------------------------------
DEPENDS+=	curl-[0-9]*:../../Aalbus/curl
DEPENDS+=	openssl-[0-9]*:../../Aalbus/openssl

.include "../../mk/bsd.pkg.mk"
