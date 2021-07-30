# $NetBSD: Makefile,v 1.2 2012/10/07 17:17:25 asau Exp $
#

DISTNAME=		refind-${_COMPAT_VER}
CATEGORIES=		sysutils

MAINTAINER=		staal1978@gmail.com
HOMEPAGE=		https://www.rodsbooks.com/refind/
COMMENT=		An EFI bootloader
LICENSE=		modified-bsd

NO_CHECKSUM=		yes

USE_TOOLS+=		gmake

.include "../../mk/bsd.prefs.mk"

_COMPAT_VER!=		${DATE} +%Y%m%d

GIT_REPOSITORIES=	refind
GIT_REPO.refind=	git://git.code.sf.net/p/refind/code#branch=master
WRKSRC=			${WRKDIR}/refind

pre-build:
	sed -i s'/)gcc/)clang/g' $(WRKSRC)/Make.common
	sed -i s'/-fno-tree-loop-distribute-patterns//g' $(WRKSRC)/Make.common
	# sed -i s'/-Bsymbolic -nostdlib/-Bsymbolic -nostdlib -subsystem:efi_application -nodefaultlib -dll/g' $(WRKSRC)/Make.common
	sed -i s'|-fpic|-ffreestanding -static|g' $(WRKSRC)/Make.common
	# sed -i 's/--target=efi-/--target=binary #/g' -i $(WRKSRC)/Make.common #this hack made it build but is WRONG! Cheated by copying .efi files from Arch.
	# hardcode RefindDir, so that refind-install can find refind_x64.efi
	sed -e 's|RefindDir=\"\$ThisDir/refind\"|RefindDir="/usr/share/refind/"|g' -i $(WRKSRC)/refind-install

# MAKE_FLAGS+=	all_gnuefi

do-install:
	mkdir -p $(DESTDIR)/usr/{bin,etc/refind.d/keys,share/refind/{drivers_x64,tools_x64,keys,fonts,icons/svg},share/man/man8,share/doc/refind/html}
	install -m0644 $(WRKSRC)/refind/*.efi $(DESTDIR)/usr/share/refind/
	install -m0644 $(WRKSRC)/refind.conf-sample $(DESTDIR)/usr/share/refind/
	# install -m0644 $(WRKSRC)/drivers_*/*.efi $(DESTDIR)/usr/share/refind/drivers_x86/
	install -m0644 $(WRKSRC)/gptsync/*.efi $(DESTDIR)/usr/share/refind/tools_x64/
	install -m0644 $(WRKSRC)/keys/*{cer,crt} $(DESTDIR)/usr/share/refind/keys/
	install -m0644 $(WRKSRC)/fonts/*.png $(DESTDIR)/usr/share/refind/fonts/
	install -m0644 $(WRKSRC)/icons/*.png $(DESTDIR)/usr/share/refind/icons/
	install -m0644 $(WRKSRC)/icons/svg/*.svg $(DESTDIR)/usr/share/refind/icons/svg/
	install -m0755 $(WRKSRC)/{refind-{install,mkdefault},mkrlconf,mvrefind} $(DESTDIR)/usr/bin/
	install -m0755 $(WRKSRC)/fonts/mkfont.sh $(DESTDIR)/usr/bin/refind-mkfont
	install -m0644 $(WRKSRC)/docs/man/*.8 $(DESTDIR)/usr/share/man/man8/
	install -m0644 $(WRKSRC)/{CREDITS,NEWS,README}.txt $(DESTDIR)/usr/share/doc/refind/
	install -m0644 $(WRKSRC)/docs/Styles/*.css $(DESTDIR)/usr/share/doc/refind/html/


# add buildling to gnu-efi later...
# TODO : investigate if efi-clang could be used...
# And make proper .efi binaries using clang

.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
