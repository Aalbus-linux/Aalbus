# $NetBSD$
#
# Aalbus "base-devel" metapackage: everything needed to build the whole
# pkgsrc tree from source on top of "base". Installs the compiler, make
# and configure tooling, and the libraries they need.

DISTNAME=	base-devel-0.1
PKGNAME=	${DISTNAME}
CATEGORIES=	meta-pkgs
MAINTAINER=	TODO-set-maintainer@example.invalid
HOMEPAGE=	https://github.com/Aalbus-linux/Aalbus
COMMENT=	Aalbus development tools for building pkgsrc from source
LICENSE=	isc

META_PACKAGE=	yes

DEPENDS+=	base-[0-9]*:../../Aalbus/base

# --- Compiler and C/C++ runtime ---------------------------------------
DEPENDS+=	clang-[0-9]*:../../lang/clang
DEPENDS+=	musl-kernel-headers-[0-9]*:../../Aalbus/musl-kernel-headers
DEPENDS+=	musl-compat-[0-9]*:../../Aalbus/musl-compat
DEPENDS+=	efi-clang-[0-9]*:../../Aalbus/efi-clang
DEPENDS+=	elftoolchain-[0-9]*:../../Aalbus/elftoolchain

# --- Make, configure and build helpers ---------------------------------
DEPENDS+=	bmake-[0-9]*:../../devel/bmake
DEPENDS+=	kati-[0-9]*:../../devel/kati
DEPENDS+=	mk-configure-[0-9]*:../../devel/mk-configure
DEPENDS+=	pkgconf-[0-9]*:../../devel/pkgconf
DEPENDS+=	slibtool-[0-9]*:../../devel/slibtool
DEPENDS+=	samurai-[0-9]*:../../devel/samurai
DEPENDS+=	cmake-[0-9]*:../../devel/cmake

# --- Parser generators --------------------------------------------------
DEPENDS+=	byacc-[0-9]*:../../devel/byacc
DEPENDS+=	flex-[0-9]*:../../devel/flex
DEPENDS+=	gettext-tiny-[0-9]*:../../Aalbus/gettext-tiny

# --- Source control, scripting and documentation -----------------------
DEPENDS+=	git-base-[0-9]*:../../devel/git-base
DEPENDS+=	cvs-[0-9]*:../../Aalbus/cvs
DEPENDS+=	perl-[0-9]*:../../lang/perl5
DEPENDS+=	mandoc-[0-9]*:../../textproc/mandoc

# --- Libraries needed by many pkgsrc builds ----------------------------
DEPENDS+=	libedit-[0-9]*:../../devel/libedit
DEPENDS+=	libxml2-[0-9]*:../../Aalbus/libxml2
DEPENDS+=	expat-[0-9]*:../../Aalbus/libexpat
DEPENDS+=	libarchive-[0-9]*:../../Aalbus/libarchive
DEPENDS+=	pcre2-[0-9]*:../../Aalbus/pcre2
DEPENDS+=	libffi-[0-9]*:../../devel/libffi

.include "../../mk/bsd.pkg.mk"
