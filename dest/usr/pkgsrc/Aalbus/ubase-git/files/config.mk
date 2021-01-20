# ubase version
VERSION = 0.1

# paths
PREFIX = /usr
MANPREFIX = /usr/share/man

CC = clang
AR = llvm-ar
RANLIB = llvm-ranlib
STRIP = llvm-strip
NM = llvm-nm

CPPFLAGS = -O3 -D_DEFAULT_SOURCE -D_GNU_SOURCE -D_XOPEN_SOURCE=700 -D_FILE_OFFSET_BITS=64
CFLAGS   = -std=c99 -static -Wall -pedantic -I/usr/include/nsss
LDFLAGS  = -s -fuse-ld=lld -flto=thin 
LDLIBS	 = /usr/lib/nsss/libnsss.a /usr/lib/skalibs/libskarnet.a -lcrypt
