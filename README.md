![Aalbus](https://static.wikia.nocookie.net/lovecraft/images/1/16/Albp3.jpg)

# Aalbus
The master repository for the Aalbus distribution

The name Aalbus comes from the fictional giant albino penguin [*Aptenodytes albus*](https://lovecraft.fandom.com/wiki/Albino_penguin) from the Lovecraft universe.
The development of this new OS initally got inspired by early work on a musl/clang/libc++ based Gentoo stage 4, where I realized that working from that base limited the options for full customization (most notably, portage depends on bash, bash depends on readline).

The OS is not motivated by language or license fundamentalism or anti-GNU sentiments as such, but more a general desire to increase and explore the diversity in the Linux OS space, which often leads to selection of BSD and suckless alternative tools.


# Aims
Aalbus is an experimental base system which aims to be self-hosting and installable (I have not yet decided whether ZFS should be an option). The components of the base system are interesting alternative (mostly) source-compatible alternative implementations of those typically found in a standard GNU/Linux distribution. Whenever possible, alternative BSD utilities will be used.

The base system distribution in this repo will not be committed to or built with a specific package manager in mind, but if there will be a live iso or other installable media in the future, it will come with pkgsrc included along with some useful 3rd party stuff installed via pkgsrc. There may also be an additional local pkgsrc repository including useful but linux-specific packages (wlroots. sway, ...) that may not be in the pkgsrc repository. 


# Components
As a warning for future users: This Linux distribution is built with alternative libraries, which means that it is source-compatible with most open source programs but not binary-compatible with GNU/Linux. You will thus most likely never be able to run closed source binaries intended for GNU/Linux on this OS. All sources (including modifications) used for this base system are present as forked repositories under the Aalbus-Linux organization. 

## Overview of components:
Core component | Implementation
------------ | -------------
Kernel: | [Linux](https://github.com/Aalbus-linux/linux) +[Filemon](https://github.com/Aalbus-linux/filemon-linux) (+L4/L4re? + Rump? +ZFS?)
Compiler: | [LLVM/Clang (ngtc)](https://github.com/Aalbus-linux/ngtc)
YACC: | [byacc](https://github.com/Aalbus-linux/byacc-snapshots)
LEX:  | [lex](https://github.com/Aalbus-linux/lex)
M4: | [Quasar M4](https://github.com/Aalbus-linux/Quasar-m4-mirror-)
Make: | [bmake](https://github.com/Aalbus-linux/bmake) default, [kati](https://github.com/Aalbus-linux/kati) as gmake (might have to do gmake initially)
Config: | [mk-configure](https://github.com/Aalbus-linux/mk-configure)
pkg-config: | [pkgconf](https://github.com/Aalbus-linux/pkgconf)
Ninja: | [samurai](https://github.com/Aalbus-linux/samurai)
LibC: | [musl](https://github.com/Aalbus-linux/musl)
LibELF: | [elftoolchain](https://github.com/Aalbus-linux/elftoolchain)
nss: | [nsss](https://github.com/Aalbus-linux/nsss) (static)
LibC++: | [LLVM libc++ (ngtc)](https://github.com/Aalbus-linux/ngtc)
Curses: | [netbsd-curses](https://github.com/Aalbus-linux/netbsd-curses)
Readline: | [libedit](https://github.com/Aalbus-linux/libedit)
Coreutils: | [nbase (NetBSD)](https://github.com/Aalbus-linux/nbase) + [ubase (Suckless)](https://github.com/Aalbus-linux/ubase)
grep: | [ugrep](https://github.com/Aalbus-linux/ugrep)
awk: | [onetrueawk](https://github.com/Aalbus-linux/awk)
bc: | [BSD bc](https://github.com/Aalbus-linux/bc)
sed: | [FreeBSD sed](https://github.com/Aalbus-linux/freebsd-sed-linux)
Archivers: | [libarchive](https://github.com/Aalbus-linux/libarchive) [pigz](https://github.com/Aalbus-linux/pigz)
Init system: | [s6 init](https://github.com/Aalbus-linux/s6-linux-init) + openrc
Shell: | [mksh](https://github.com/Aalbus-linux/mksh)
roff: | [neatroff](https://github.com/Aalbus-linux/neatroff)
man: | [mandoc](https://github.com/Aalbus-linux/mandoc-mirror)
pager: | [most](https://github.com/Aalbus-linux/most-pager)
editor: | [vis](https://github.com/Aalbus-linux/vis)

## Overview of regular standard components in base system
Core component | Implementation
------------ | -------------
Extended file attributes: | attr
Access contol list: | acl
Shadow: | shadow
Bootloader: | syslinux
Curl: | curl
Perl: | perl
Version control: | git

