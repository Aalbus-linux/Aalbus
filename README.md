![Aalbus](https://static.wikia.nocookie.net/lovecraft/images/1/16/Albp3.jpg)

# Aalbus
The master repository for the Aalbus distribution

The name Aalbus comes from the fictional giant albino penguin [*Aptenodytes albus*](https://lovecraft.fandom.com/wiki/Albino_penguin) from the Lovecraft universe.
The development of this new OS initally got inspired by early work on a musl/clang/libc++ based Gentoo stage 4, where I realized that working from that base limited the options for full customization (most notably, portage depends on bash, bash depends on readline).

The OS is not motivated by language or license fundamentalism or anti-GNU sentiments as such, but more a general desire to increase and explore the diversity in the Linux OS space, which often leads to selection of BSD and suckless alternative tools.


# Aims
Aalbus is an experimental base system which aims to be self-hosting and installable (I have not yet decided whether ZFS should be an option). The components of the base system are interesting alternative (mostly) source-compatible alternative implementations of those typically found in a standard GNU/Linux distribution. Whenever possible, alternative BSD utilities will be used.

The base system distribution in this repo will not be committed or built with a specific package manager in mind, but if there will be a live iso or other installable media in the future, it will come with pkgsrc included along with some useful 3rd party stuff installed via pkgsrc. There may also be an additional local pkgsrc repository including useful but linux-specific packages (wlroots. sway, ...) that may not be in the pkgsrc repository. 


# Components
As a warning for future users: This Linux distribution is built with alternative libraries, which means that it is source-compatible with most open source programs but not binary-compatible with GNU/Linux. You will thus most likely never be able to run closed source binaries intended for GNU/Linux on this OS. All sources (including modifications) used for this base system are present as forked repositories under the Aalbus-Linux organization. 

## Overview of components:
Core component | Implementation
------------ | -------------
Kernel: | Linux (+ Rump? +Zsh?)
Compiler: | LLVM/Clang (ngtc)
YACC: | byacc
LEX:  | lex
M4: | Quasar M4
Make: | kati (might have to do gmake initially)
Ninja: | samurai
LibC: | musl
LibELF: | elftoolchain
nss: | nsss
LibC++: | LLVM libc++
Curses: | netbsd-curses
Readline: | editline
Coreutils: | nbase (NetBSD) + ubase (Suckless)
grep: | ugrep
Archivers: | libarchive
Init system: | s6 + openrc
Shell: | mksh
roff: | neatroff
man: | mandoc
editor: | vis
