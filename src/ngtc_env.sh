#!/bin/sh

export PATH="/mnt/dest/bin:/x86_64-pc-linux-musl/bin:$PATH"
export LIBRARY_PATH="/mnt/dest/lib:/mnt/dest/usr/lib:/x86_64-pc-linux-musl/lib:$LIBRARY_PATH"
export CFLAGS="-I/mnt/dest/include -I/mnt/dest/usr/include -I/x86_64-pc-linux-musl/include $CFLAGS"
export LDFLAGS="-L/mnt/dest/lib -L/mnt/dest/usr/lib -L/x86_64-pc-linux-musl/lib $LDFLAGS"
export CC="clang"
export CXX="clang++"
export LD="lld"
export AR="llvm-ar"
export NM="llvm-nm"
export RANLIB="llvm-ranlib"

exec /bin/sh



