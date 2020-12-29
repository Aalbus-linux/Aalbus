![Aalbus](https://static.wikia.nocookie.net/lovecraft/images/1/16/Albp3.jpg)

# Aalbus
The master repository for the Aalbus distribution

The name Aalbus comes from the fictional giant albino penguin [*Aptenodytes albus*](https://lovecraft.fandom.com/wiki/Albino_penguin) from the Lovecraft universe.
The development of this new OS initally got inspired by early work on a musl/clang/libc++ based Gentoo stage 4, where I realized that working from that base limited the options for full customization (most notably, portage depends on bash, bash depends on readline).

The OS is not motivated by language or license fundamentalism or anti-GNU sentiments as such, but more a general desire to increase and explore the diversity in the Linux OS space, which often leads to selection of BSD and suckless alternative tools.


# Aims
Aalbus is an experimental base system which aims to be self-hosting and installable (I have not yet decided whether ZFS should be an option). The components of the base system are interesting (mostly) source-compatible alternative implementations of those typically found in a standard GNU/Linux distribution. Whenever possible, BSD utilities will be used.

The base system distribution in this repo will not be committed to or built with a specific package manager in mind, but if there will be a live iso or other installable media in the future, it will come with pkgsrc included along with some useful 3rd party stuff installed via pkgsrc. There may also be an additional local pkgsrc repository including useful but linux-specific packages (wlroots. sway, ...) that may not be in the pkgsrc repository. 


# Components
As a warning for future users: This Linux distribution is built with alternative libraries, which means that it is source-compatible with most open source programs but not binary-compatible with GNU/Linux. You will thus most likely never be able to run closed source binaries intended for GNU/Linux on this OS. All sources (including modifications) used for this base system are present as forked repositories under the Aalbus-Linux organization. 

## Overview of components:
Core component | Implementation | Built
------------ | ------------- | -------------
Kernel: | [Linux](https://github.com/Aalbus-linux/linux) +[Filemon](https://github.com/Aalbus-linux/filemon-linux) (+ZFS?) | 
Compiler: | bootstrap: [ngtc](https://github.com/Aalbus-linux/ngtc) final: [LLVM/Clang checkedC](https://github.com/Aalbus-linux/checkedc-clang) |  ✅ 
YACC: | [byacc](https://github.com/Aalbus-linux/byacc-snapshots) | 
LEX:  | [lex](https://github.com/Aalbus-linux/lex) | 
M4: | [Quasar M4](https://github.com/Aalbus-linux/Quasar-m4-mirror-) | 
Make: | [bmake](https://github.com/Aalbus-linux/bmake) as make, [kati](https://github.com/Aalbus-linux/kati) as gmake | 
Config: | [mk-configure](https://github.com/Aalbus-linux/mk-configure) | 
pkg-config: | [pkgconf](https://github.com/Aalbus-linux/pkgconf) | 
libtool: | [slibtool](https://github.com/Aalbus-linux/slibtool) | 
Ninja: | [samurai](https://github.com/Aalbus-linux/samurai) | 
LibC: | [musl](https://github.com/Aalbus-linux/musl) + [llvm-crt-replacement](https://github.com/Aalbus-linux/llvm-crt-replacement) |  ✅   ✅ 
LibELF: | [elftoolchain](https://github.com/Aalbus-linux/elftoolchain) | 
nss: | [nsss](https://github.com/Aalbus-linux/nsss) (static) | 
LibC++: | bootstrap: [ngtc](https://github.com/Aalbus-linux/ngtc) final: [LLVM](https://github.com/Aalbus-linux/checkedc-clang) |  ✅  
Curses: | [netbsd-curses](https://github.com/Aalbus-linux/netbsd-curses) | 
Readline: | [libedit](https://github.com/Aalbus-linux/libedit) | 
Coreutils: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase) + [ubase (Suckless)](https://github.com/Aalbus-linux/ubase) | 
grep: | [ugrep](https://github.com/Aalbus-linux/ugrep) | 
awk: | [onetrueawk](https://github.com/Aalbus-linux/awk) | 
bc: | [BSD bc](https://github.com/Aalbus-linux/bc) | 
sed: | [FreeBSD sed](https://github.com/Aalbus-linux/freebsd-sed-linux) | 
Archivers: | [libarchive](https://github.com/Aalbus-linux/libarchive) [pigz](https://github.com/Aalbus-linux/pigz) | 
Init system: | [s6 init](https://github.com/Aalbus-linux/s6-linux-init) + openrc |
udev: | [mdevd](https://github.com/Aalbus-linux/mdevd) | 
Shell: | [mksh](https://github.com/Aalbus-linux/mksh) | 
roff: | [neatroff](https://github.com/Aalbus-linux/neatroff) | 
man: | [mandoc](https://github.com/Aalbus-linux/mandoc-mirror) | 
pager: | [most](https://github.com/Aalbus-linux/most-pager) | 
editor: | [vis](https://github.com/Aalbus-linux/vis) | 


## Overview of regular standard components in base system
Core component | Implementation | Built
------------ | ------------- | -------------
Extended file attributes: | [attr](https://github.com/Aalbus-linux/attr) | 
Access contol list: | [acl](https://github.com/Aalbus-linux/acl) | 
Pam | [OpenPAM](https://github.com/Aalbus-linux/OpenPAM) | 
Magic | [file](https://github.com/Aalbus-linux/file) | 
Shadow: | [shadow](https://github.com/Aalbus-linux/shadow) | 
Bootloader: | syslinux | 
Curl: | curl | 
Perl: | perl | 
Version control: | git | 

## extra dependencies pulled in by above packages
Package | Dependency | Built
------------ | ------------- | -------------
most: | [S-Lang](https://github.com/Aalbus-linux/S-Lang) |
attr: | [gettext-tiny](https://github.com/Aalbus-linux/gettext-tiny) |  ✅ 
shadow: | [libcap-ng](https://github.com/Aalbus-linux/libcap-ng) |
shadow: | [skey](https://github.com/Aalbus-linux/skey) | 
s6 init: | [skalibs](https://github.com/Aalbus-linux/skalibs) |
: | [libbsd](https://github.com/Aalbus-linux/libbsd) | 
: | [libnl-tiny](https://github.com/Aalbus-linux/libnl-tiny) |  ✅ 
: | [gnu-getopt](https://github.com/Aalbus-linux/gnu-getopt) |  ✅ 
