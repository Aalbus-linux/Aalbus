#!/bin/sh

export PATH="/mnt/dest/bin:/x86_64-linux-pc-musl/bin:$PATH"
export LIBRARY_PATH="/mnt/dest/lib:/mnt/dest/usr/lib:/x86_64-linux-pc-musl/lib:$LIBRARY_PATH"
export CFLAGS="-I/mnt/dest/include -I/x86_64-linux-pc-musl/include -L/mnt/dest/lib -L/mnt/dest/usr/lib -L/x86_64-linux-pc-musl/lib $CFLAGS"
export CC="clang"
export CXX="clang++"
export LD="lld"
export AR="llvm-ar"
export NM="llvm-nm"
export RANLIB="llvm-ranlib"



