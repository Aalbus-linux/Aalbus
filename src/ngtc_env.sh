#!/bin/sh

export PATH="/x86_64-pc-linux-musl/bin:/usr/bin:/bin:/sbin:/mnt/dest/usr/bin:/mnt/dest/bin"
export LIBRARY_PATH="/mnt/dest/lib:/mnt/dest/usr/lib:/x86_64-pc-linux-musl/lib"
export CFLAGS="-fPIC -I/mnt/dest/include -I/mnt/dest/usr/include"
export CXXFLAGS="-stdlib=libc++ $CFLAGS"
export LDFLAGS="-fuse-ld=lld -rtlib=compiler-rt -unwindlib=libunwind -L/mnt/dest/lib -L/mnt/dest/usr/lib -L/x86_64-pc-linux-musl/lib"
export CC="clang"
export CXX="clang++"
export LD="lld"
export AR="llvm-ar"
export NM="llvm-nm"
export RANLIB="llvm-ranlib"

cp /mnt/dest/usr/lib/*.o /x86_64-pc-linux-musl/lib/
cp /x86_64-pc-linux-musl/lib/libc++.so /usr/lib/libc++.so.1
cp /x86_64-pc-linux-musl/lib/libc++abi.so /usr/lib/libc++abi.so.1

exec /bin/sh



