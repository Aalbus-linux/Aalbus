![Aalbus](https://static.wikia.nocookie.net/lovecraft/images/1/16/Albp3.jpg)

# Aalbus
The master repository for the Aalbus distribution

The name Aalbus comes from the fictional giant albino penguin [*Aptenodytes albus*](https://lovecraft.fandom.com/wiki/Albino_penguin) from the [Lovecraft universe](https://en.wikipedia.org/wiki/Lovecraftian_horror). The selection of the mascot is also a nod to Gentoo (a species of penguin), Tux (a penguin) and Beastie (a demonic mascot).
The development of this new OS initally got inspired by early work on a musl/clang/libc++ based Gentoo stage 4, where I realized that working from that base limited the options for full customization (most notably, portage depends on bash, bash depends on readline).

The OS is not motivated by language or license fundamentalism or anti-GNU sentiments as such, but more a general desire to increase and explore the diversity in the Linux OS space, which often leads to selection of BSD and suckless alternative tools.


# Aims
Aalbus is an experimental base system which aims to be self-hosting and installable (I have not yet decided whether ZFS should be an option). The components of the base system are interesting (mostly) source-compatible alternative implementations of those typically found in a standard GNU/Linux distribution. Whenever possible, BSD utilities will be used.

The base system distribution in this repo will not be committed to or built with a specific package manager in mind, but if there will be a live iso or other installable media in the future, it will come with pkgsrc included along with some useful 3rd party stuff installed via pkgsrc. There may also be an additional local pkgsrc repository including useful but linux-specific packages (wlroots. sway, ...) that may not be in the pkgsrc repository. 


# Components
As a warning for future users: This Linux distribution is built with alternative libraries, which means that it is source-compatible with most open source programs but not binary-compatible with GNU/Linux. You will thus most likely never be able to run closed source binaries intended for GNU/Linux on this OS. All sources (including modifications) used to [bootstrap](https://github.com/Aalbus-linux/Aalbus/blob/main/src/bootstrap) this base system are present as forked repositories under the Aalbus-Linux organization. The continued development strategy from inside the Aalbus sustem has changed from following -git to use release tarballs for several components, mostly because of autotools dependencies in development sources. Details will be found under [/usr/local/scripts](https://github.com/Aalbus-linux/Aalbus/tree/main/dest/usr/local/scripts).

## Overview of components:
Core component | Implementation | Built
------------ | ------------- | -------------
Kernel: | [Linux](https://github.com/Aalbus-linux/linux) +[Filemon](https://github.com/Aalbus-linux/filemon-linux) (+ZFS?) | 
C compiler: | bootstrap: [ngtc](https://github.com/Aalbus-linux/ngtc) final: [LLVM/Clang](https://github.com/Aalbus-linux/llvm-project) |  ✅ ✅
C++ compiler: | bootstrap: [ngtc](https://github.com/Aalbus-linux/ngtc) final: [LLVM/Clang++](https://github.com/Aalbus-linux/llvm-project) |  ✅ ✅
Fortran compiler: | [LLVM/Flang](https://github.com/Aalbus-linux/llvm-project) |  ✅
YACC: | [byacc](https://github.com/Aalbus-linux/byacc-snapshots) | ✅ 
LEX:  | [lex](https://github.com/Aalbus-linux/lex) |  ✅ 
M4: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase)  | ✅
Make: | [bmake](https://github.com/Aalbus-linux/bmake) as make, [kati](https://github.com/Aalbus-linux/kati) as gmake | ✅ ✅ 
Config: | [mk-configure](https://github.com/Aalbus-linux/mk-configure) | ✅ 
pkg-config: | [pkgconf](https://github.com/Aalbus-linux/pkgconf) | ✅ 
libtool: | [slibtool](https://github.com/Aalbus-linux/slibtool) |  ✅
Ninja: | [samurai](https://github.com/Aalbus-linux/samurai) | ✅
LibC: | [musl](https://github.com/Aalbus-linux/musl) + [llvm-crt-replacement](https://github.com/Aalbus-linux/llvm-crt-replacement) |  ✅   ✅ 
LibELF: | [elftoolchain](https://github.com/Aalbus-linux/elftoolchain) | ✅
nss: | [nsss](https://github.com/Aalbus-linux/nsss) (static) |   ✅ 
LibC++: | bootstrap: [ngtc](https://github.com/Aalbus-linux/ngtc) final: [LLVM](https://github.com/Aalbus-linux/llvm-project) |  ✅  ✅
Curses: | [netbsd-curses](https://github.com/Aalbus-linux/netbsd-curses) |   ✅ 
Readline: | [libedit](https://github.com/Aalbus-linux/libedit) |  ✅
Pam | [OpenPAM](https://github.com/Aalbus-linux/OpenPAM) | ✅
libcap | [libcap-ng](https://github.com/Aalbus-linux/libcap-ng) | ✅
Coreutils: | bootstrap: [sbase (Suckless)]() final: [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase)  | ✅ ✅
util-linux: | [ubase (Suckless)](https://github.com/Aalbus-linux/ubase) (static) | ✅
grep: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase) (/bin) [ugrep)](https://github.com/Aalbus-linux/ugrep) (/usr/bin) | ✅ 
awk: | [onetrueawk](https://github.com/Aalbus-linux/awk) | ✅ 
bc: | [BSD bc](https://github.com/Aalbus-linux/bc) | ✅ 
sed: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase)  | ✅
zlib: | [zlib-ng](https://github.com/Aalbus-linux/zlib-ng) | ✅ 
Archivers: | [libarchive](https://github.com/Aalbus-linux/libarchive) + [pigz](https://github.com/Aalbus-linux/pigz) | ✅ ✅
Init system: | [s6 init](https://github.com/Aalbus-linux/s6-linux-init) + [s6-rc](https://github.com/Aalbus-linux/s6-linux-init) | ✅ ✅ 
udev: | [mdevd](https://github.com/Aalbus-linux/mdevd) |  ✅ 
Shell: | [mksh](https://github.com/Aalbus-linux/mksh) (static) | ✅ 
roff: | [neatroff](https://github.com/Aalbus-linux/neatroff) nroff: [heirloom-doctools](https://github.com/Aalbus-linux/heirloom-doctools)| ✅ ✅
man: | [mandoc](https://github.com/Aalbus-linux/mandoc-mirror) | ✅ 
pager: | [most](https://github.com/Aalbus-linux/most-pager) | ✅ 
editor: | [vis](https://github.com/Aalbus-linux/vis) (also installed as vi) | ✅


## Overview of regular standard components in base system
Core component | Implementation | Built
------------ | ------------- | -------------
Extended file attributes: | [attr](https://github.com/Aalbus-linux/attr) |   ✅ 
Access contol list: | [acl](https://github.com/Aalbus-linux/acl) |  ✅ 
Magic | [file](https://github.com/Aalbus-linux/file) |  ✅
Shadow: | [shadow](https://github.com/Aalbus-linux/shadow) | ✅
Bootloader: | syslinux | 
Curl: | [curl](https://github.com/Aalbus-linux/curl) | ✅ 
Perl: | [perl5](https://github.com/Aalbus-linux/perl5) | ✅
Version control: | git | ✅ 
CMake : | CMake | ✅ 

## extra dependencies pulled in by above packages
Package | Dependency | Built
------------ | ------------- | -------------
most | [S-Lang](https://github.com/Aalbus-linux/S-Lang) |   ✅ 
attr | [gettext-tiny](https://github.com/Aalbus-linux/gettext-tiny) |  ✅ 
shadow | [libcap-ng](https://github.com/Aalbus-linux/libcap-ng) | ✅
shadow | [skey](https://github.com/Aalbus-linux/skey) | ✅
s6-linux-init | [skalibs](https://github.com/Aalbus-linux/skalibs) |   ✅ 
s6-linux-init | [s6](https://github.com/Aalbus-linux/s6) | ✅
s6-networking | [s6-dns](https://github.com/Aalbus-linux/s6-dns) | ✅
: | [s6-networking](https://github.com/Aalbus-linux/s6-networking) | ✅
s6-linux-init | [execline](https://github.com/Aalbus-linux/execline) |    ✅ 
s6-linux-init | [utpmps](https://github.com/Aalbus-linux/utmps) |   ✅ 
freebsd-sed-linux | [libbsd](https://github.com/Aalbus-linux/libbsd) + Alpine BSD compat headers | ✅ ✅
: | [libnl-tiny](https://github.com/Aalbus-linux/libnl-tiny) |  ✅ 
: | [gnu-getopt](https://github.com/Aalbus-linux/gnu-getopt) |  ✅ 
: | [libglob](https://github.com/Aalbus-linux/libglob) | ✅
libarchive | [bzip2](https://github.com/Aalbus-linux/bzip2) | ✅ 
libarchive | [libb2](https://github.com/Aalbus-linux/libb2) | ✅
libarchive | [lz4](https://github.com/Aalbus-linux/lz4) | ✅
libarchive | [zsst](https://github.com/Aalbus-linux/zstd) | ✅
libarchive | [xz](https://github.com/Aalbus-linux/xz) | ✅
libarchive | [lzo2](https://github.com/Aalbus-linux/lzo2) | ✅
libarchive | [libxml2](https://github.com/Aalbus-linux/libxml2) | ✅
libarchive | [libexpat](https://github.com/Aalbus-linux/libexpat) | ✅
libarchive | [openssl](https://github.com/Aalbus-linux/openssl) | ✅
ugrep | [pcre2](https://github.com/Aalbus-linux/pcre2) | ✅
mk-configure | [bmkdep](https://github.com/Aalbus-linux/bmkdep) | ✅ 
nbase | [musl-fts](https://github.com/Aalbus-linux/musl-fts) | ✅
vis | [libtermkey](https://github.com/Aalbus-linux/libtermkey) | ✅
vis | [lpeg](https://github.com/Aalbus-linux/lpeg) | ✅
vis | [tre](https://github.com/Aalbus-linux/tre) | ✅
vis | [lua](https://github.com/Aalbus-linux/lua) | ✅
