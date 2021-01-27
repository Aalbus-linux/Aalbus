![Aalbus](https://static.wikia.nocookie.net/lovecraft/images/1/16/Albp3.jpg)

# Aalbus
## The master repository for the Aalbus distribution, a Linux distribution using musl libc, the LLVM tool chain and a mostly (Net)BSD-derived userland.

The name Aalbus comes from the fictional giant albino penguin [*Aptenodytes albus*](https://lovecraft.fandom.com/wiki/Albino_penguin) from the [Lovecraft universe](https://en.wikipedia.org/wiki/Lovecraftian_horror). The selection of the mascot is also a nod to Gentoo (a species of penguin), Tux (a penguin) and Beastie (a demonic mascot).
The development of this new OS initally got inspired by early work on a musl/clang/libc++ based Gentoo stage 4, where I realized that working from that base limited the options for full customization (most notably, portage depends on bash, bash depends on readline).

The OS is not motivated by language or license fundamentalism or anti-GNU sentiments as such, but more a general desire to increase and explore the diversity in the Linux OS space, which often leads to selection of BSD and suckless alternative tools.

# Contact and community
As Aalbus matures, one of the aims is naturally to recruit other interested people and to evolve the OS from a personal hobby project to one that is managed by a community as a real distro. Discussion can currently be done on the [Github issue tracker](https://github.com/Aalbus-linux/Aalbus/issues), [Reddit](https://www.reddit.com/r/aalbuslinux/) or [Discord](https://discord.gg/8fg4uP3vgY). Welcome!

# Aims
Aalbus is an experimental base system which aims to be self-hosting and installable. The components of the base system are interesting (mostly) source-compatible alternative implementations of those typically found in a standard GNU/Linux distribution. Whenever possible, BSD utilities will be used.

The base system distribution includes the pkgsrc package manager, and the aim is to package the entire base distribution using custom mkfiles under a custom "Aalbus" sub-directory in pkgsrc. A problem that needs to be solved is that pkgsrc tends to pull in a lot of dependencies that the bootstrapped system has shown are not needed, which leads to a "bloating" of the system. Because of this, the migration will be gradual and at first will only packages that can be built cleanly in pkgsrc be migrated. The /usr/pkg directory is merged with / and /usr.

# Components
As a warning for future users: This Linux distribution is built with alternative libraries, which means that it is source-compatible with most open source programs but not binary-compatible with GNU/Linux. You will thus most likely never be able to run closed source binaries intended for GNU/Linux on this OS. All sources (including modifications) used to [bootstrap](https://github.com/Aalbus-linux/Aalbus/blob/main/src/bootstrap) this base system are present as forked repositories under the Aalbus-Linux organization. The continued development strategy from inside the Aalbus system has changed from following -git to use a modified local fork of pkgsrc (2020Q4). Details will be found under [/usr/local/scripts](https://github.com/Aalbus-linux/Aalbus/tree/main/dest/usr/local/scripts) where especially the configuration for the LLVM toolchain currently resides and [/usr/pkgsrc/Aalbus](https://github.com/Aalbus-linux/Aalbus/tree/main/dest/usr/pkgsrc/Aalbus) with locally modified or generated packages specifically for Aalbus. Ultimately, all components will hopefully migrate to pkgsrc packages, which will mean that the base system can be managed and installed from a binary package repository. At a later stage, local modifications will be changed to external patches and directories so that most of the system can be maintained using vanilla upstream pkgsrc.

## Overview of components:
With the migration to pkgsrc, the list below is not complete since pkgsrc pulls in several other dependencies. Initially this "fat" developer image with all the tools will be released. When things have matured, a minimal "user" image will be generated where only utilities needed to boot, run, partition and format disk, install and use the binary package manager to install programs (including all the developer tools present in the "fat" image).

Core component | Implementation | Built | migrated to pkgsrc
------------ | ------------- | ------------- | -------------
Kernel: | [Linux](https://github.com/Aalbus-linux/linux) +[Filemon](https://github.com/Aalbus-linux/filemon-linux) +[ZFS](https://github.com/Aalbus-linux/zfs) | |
C compiler: | [LLVM/Clang](https://github.com/Aalbus-linux/llvm-project) | ✅ |
C++ compiler: | [LLVM/Clang++](https://github.com/Aalbus-linux/llvm-project) | ✅ |
Fortran compiler: | [LLVM/Flang](https://github.com/Aalbus-linux/llvm-project) | ✅ |
YACC: | [byacc](https://github.com/Aalbus-linux/byacc-snapshots) | ✅ | ✅ 
LEX:  | [flex](https://github.com/Aalbus-linux/flex) and [RE-flex](https://github.com/Aalbus-linux/RE-flex) | ✅ ✅ | ✅ ✅
M4: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase)  | ✅ | ✅
Make: | [bmake](https://github.com/Aalbus-linux/bmake) as make, [kati](https://github.com/Aalbus-linux/kati) as gmake | ✅ ✅ | ✅ x
Config: | [mk-configure](https://github.com/Aalbus-linux/mk-configure) | ✅ | ✅ 
pkg-config: | [pkgconf](https://github.com/Aalbus-linux/pkgconf) | ✅ | ✅
libtool: | [slibtool](https://github.com/Aalbus-linux/slibtool) |  ✅ | ✅
Ninja: | [samurai](https://github.com/Aalbus-linux/samurai) | ✅ | ✅
LibC: | [musl](https://github.com/Aalbus-linux/musl) + [llvm-crt-replacement](https://github.com/Aalbus-linux/llvm-crt-replacement) |  ✅ ✅ | ✅ x 
LibELF: | [elftoolchain](https://github.com/Aalbus-linux/elftoolchain) | ✅ | ✅
nss: | [nsss](https://github.com/Aalbus-linux/nsss) (static) | ✅ | ✅
LibC++: | [LLVM/libc++](https://github.com/Aalbus-linux/llvm-project) | ✅ |
Curses: | [netbsd-curses](https://github.com/Aalbus-linux/netbsd-curses) | ✅ | ✅ 
Readline: | [libedit](https://github.com/Aalbus-linux/libedit) | ✅ | ✅
Pam | [OpenPAM](https://github.com/Aalbus-linux/OpenPAM) | ✅ | ✅
libcap | [libcap-ng](https://github.com/Aalbus-linux/libcap-ng) | ✅ |
Coreutils: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase) | ✅ | ✅
util-linux: | [ubase (Suckless)](https://github.com/Aalbus-linux/ubase) (static) | ✅ | ✅
grep: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase) and [ugrep](https://github.com/Aalbus-linux/ugrep) | ✅ ✅ | ✅ ✅
awk: | [onetrueawk](https://github.com/Aalbus-linux/awk) | ✅ | ✅
bc: | [BSD bc](https://github.com/Aalbus-linux/bc) | ✅ | ✅
sed: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase) | ✅ | ✅
zlib: | zlib | ✅ | ✅
Archivers: | [libarchive](https://github.com/Aalbus-linux/libarchive) + [pigz](https://github.com/Aalbus-linux/pigz) | ✅ ✅ | ✅ ✅
Init system: | [s6 init](https://github.com/Aalbus-linux/s6-linux-init) + [s6-rc](https://github.com/Aalbus-linux/s6-linux-init) | ✅ ✅ | 
udev: | [mdevd](https://github.com/Aalbus-linux/mdevd) | ✅ |
Shell: | [mksh](https://github.com/Aalbus-linux/mksh) (static) | ✅ | ✅
roff: | [heirloom-doctools](https://github.com/Aalbus-linux/heirloom-doctools)| ✅ | ✅
man: | [mandoc](https://github.com/Aalbus-linux/mandoc-mirror) | ✅ | ✅
pager: | [most](https://github.com/Aalbus-linux/most-pager) | ✅ | ✅
editor: | [vim](https://github.com/Aalbus-linux/vim) (also installed as vi, [nvi](https://sites.google.com/a/bostic.com/keithbostic/vi/) as backup) | ✅ ✅ | ✅ ✅

## Overview of regular standard components in base system
Core component | Implementation | Built | migrated to pkgsrc
------------ | ------------- | ------------- | -------------
Extended file attributes: | [attr](https://github.com/Aalbus-linux/attr) | ✅ | ✅ 
Access contol list: | [acl](https://github.com/Aalbus-linux/acl) | ✅ | ✅
Magic | [file](https://github.com/Aalbus-linux/file) | ✅ | ✅
Shadow | [shadow](https://github.com/Aalbus-linux/shadow) | ✅ | ✅ 
Bootloader | syslinux | |
dosfstools | dosfstools | ✅ | ✅
e2fs-tools | e2fstools | ✅ | ✅ 
f2fs-tools | f2fs-tools | ✅ | ✅
xfs-tools | xfs-tools | ✅ | ✅
btrfs-tools | btrfs-tools | |
zfs tools | zfs | |
fdisk | gptfdisk | ✅ | ✅
Curl | [curl](https://github.com/Aalbus-linux/curl) | ✅ | ✅
Perl | [perl5](https://github.com/Aalbus-linux/perl5) | ✅ | ✅
Version control: | git | ✅ | ✅
Version control: | [cvs](https://github.com/Aalbus-linux/cvs) | ✅ | ✅
CMake | CMake | ✅ | ✅
Package Manager | pkgsrc | ✅ | ✅ 

## extra dependencies pulled in by above packages
Package | Dependency | Built | migrated to pkgsrc
------------ | ------------- | ------------- | -------------
LLVM | libexecinfo | ✅ | ✅
most | [S-Lang](https://github.com/Aalbus-linux/S-Lang) | ✅ | ✅ 
attr | [gettext-tiny](https://github.com/Aalbus-linux/gettext-tiny) | ✅ | gettext 
shadow | [libcap-ng](https://github.com/Aalbus-linux/libcap-ng) | ✅ |
shadow | [skey](https://github.com/Aalbus-linux/skey) | ✅ | ✅ 
s6-linux-init | [skalibs](https://github.com/Aalbus-linux/skalibs) | ✅ | ✅ 
s6-linux-init | [s6](https://github.com/Aalbus-linux/s6) | ✅ | ✅
s6-networking | [s6-dns](https://github.com/Aalbus-linux/s6-dns) | ✅ | ✅
: | [s6-networking](https://github.com/Aalbus-linux/s6-networking) | ✅ |
s6-linux-init | [execline](https://github.com/Aalbus-linux/execline) | ✅ | ✅ 
s6-linux-init | [utpmps](https://github.com/Aalbus-linux/utmps) | ✅ | ✅
: | [libbsd](https://github.com/Aalbus-linux/libbsd) + Alpine BSD compat headers | ✅ ✅ | ✅ x
: | [libnl-tiny](https://github.com/Aalbus-linux/libnl-tiny) |  ✅ | gettext
: | [gnu-getopt](https://github.com/Aalbus-linux/gnu-getopt) |  ✅ | x
: | [libglob](https://github.com/Aalbus-linux/libglob) | ✅ | x
libarchive | [bzip2](https://github.com/Aalbus-linux/bzip2) | ✅ | ✅ 
libarchive | [libb2](https://github.com/Aalbus-linux/libb2) | ✅ | ✅ 
libarchive | [lz4](https://github.com/Aalbus-linux/lz4) | ✅ | ✅ 
libarchive | [zstd](https://github.com/Aalbus-linux/zstd) | ✅ | ✅ 
libarchive | [xz](https://github.com/Aalbus-linux/xz) | ✅ | ✅ 
libarchive | [lzo2](https://github.com/Aalbus-linux/lzo2) | ✅ | ✅
libarchive | [libxml2](https://github.com/Aalbus-linux/libxml2) | ✅ | ✅
libarchive | [libexpat](https://github.com/Aalbus-linux/libexpat) | ✅ | ✅ 
libarchive | [openssl](https://github.com/Aalbus-linux/openssl) | ✅ | ✅
ugrep | [pcre2](https://github.com/Aalbus-linux/pcre2) | ✅ | ✅
mk-configure | [bmkdep](https://github.com/Aalbus-linux/bmkdep) | ✅ | ✅ 
nbase | [musl-fts](https://github.com/Aalbus-linux/musl-fts) | ✅ | ✅
vis | [libtermkey](https://github.com/Aalbus-linux/libtermkey) | ✅ | ✅
vis | [lpeg](https://github.com/Aalbus-linux/lpeg) | ✅ |
vis | [tre](https://github.com/Aalbus-linux/tre) | ✅ | ✅
vis | [lua](https://github.com/Aalbus-linux/lua) | ✅ | ✅
e2fs-tools | libuuid | ✅ | ✅
e2fs-tools | libblkid | ✅ | ✅
btrfs-tools | libmount | ✅ | ✅
