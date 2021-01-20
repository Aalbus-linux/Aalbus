# $NetBSD: Makefile,v 1.12 2012/11/23 22:34:05 othyro Exp $

DISTNAME=		shadow-4.8.1
CATEGORIES=		sysutils devel
MASTER_SITES=		https://github.com/shadow-maint/shadow/releases/download/4.8.1/
EXTRACT_SUFX=		.tar.xz

MAINTAINER=		reed@reedmedia.net
HOMEPAGE=		http://shadow.pld.org.pl/
COMMENT=		User administration and passwd database tools for Linux

ONLY_FOR_PLATFORM=	Linux-*-* # Linux shadow format


GNU_CONFIGURE=		YES
USE_LIBTOOL=		yes

.include "../../mk/bsd.prefs.mk"

PKG_OPTIONS_VAR=	PKG_OPTIONS.shadow
PKG_SUPPORTED_OPTIONS=	pam libcrack

PKG_OPTIONS.shadow=	pam
CONFIGURE_ARGS+=	--disable-nls

.include "../../mk/bsd.options.mk"


###
### PAM support.
###
.  include "../../security/openpam/buildlink3.mk"
CONFIGURE_ARGS+=	--with-libpam
MESSAGE_SRC+=		${.CURDIR}/MESSAGE.pam
EGDIR=			${PREFIX}/share/examples/${PKGBASE}
MESSAGE_SUBST+=		EGDIR=${EGDIR}
PLIST_SUBST+=		PAM=

###
### Support using libcrack to protect against weak passwords.
###
.if !empty(PKG_OPTIONS:Mlibcrack)
.  include "../../security/libcrack/buildlink3.mk"
CONFIGURE_ARGS+=	--with-libcrack
.else
CONFIGURE_ARGS+=	--without-libcrack
.endif

post-install:
	${INSTALL_DATA_DIR} ${EGDIR}
	${INSTALL_DATA} ${FILESDIR}/shadow.pam ${EGDIR}/
	${INSTALL_DATA} ${FILESDIR}/useradd.pam ${EGDIR}/
	rm ${DESTDIR}${PREFIX}/share/man/man1/groups.1


.include "../../mk/bsd.pkg.mk"
