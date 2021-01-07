#!/bin/sh

rm -rf llvm-project/build
mkdir -p llvm-project/build
cd llvm-project/build

cmake -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;compiler-rt;libunwind;libcxx;libcxxabi;lldb;openmp;polly;flang" -DCMAKE_BUILD_TYPE=Release \
 -DCMAKE_INSTALL_PREFIX=/usr -DLLVM_BINUTILS_INCDIR=/usr/include -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
 -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_FFI=ON -DFFI_INCLUDE_DIR='/mnt/dest/usr/include' -DFFI_LIBRARY_DIR:PATH='/mnt/dest/usr/lib' \
 -DZLIB_LIBRARY='/mnt/dest/usr/lib/libz.a' -DZLIB_INCLUDE_DIR='/mnt/dest/usr/include' -DLIBXML2_LIBRARY='/mnt/dest/usr/lib/libxml2.a' -DLIBXML2_INCLUDE_DIR='/mnt/dest/usr/include' \
 -DLLVM_BUILD_DOCS=OFF -DLLVM_INCLUDE_DOCS=OFF -DLLVM_BUILD_EXAMPLES=OFF -DLLVM_TARGETS_TO_BUILD='X86' -DLLVM_INSTALL_UTILS=ON -DCLANG_BUILD_EXAMPLES=OFF -DCLANG_INCLUDE_DOCS=OFF \
 -DLIBCXX_HAS_MUSL_LIBC=ON -D_LIBCPP_HAS_MUSL_LIBC=ON -DCLANG_DEFAULT_CXX_STDLIB=libc++ -DLIBCXX_CXX_ABI=libcxxabi -DLIBCXXABI_USE_COMPILER_RT=YES \
 -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON -DCLANG_DEFAULT_CXX_STDLIB=libc++ -DCLANG_DEFAULT_LINKER=lld \
 -DCLANG_DEFAULT_RTLIB=compiler-rt  -DCLANG_PLUGIN_SUPPORT=ON -DLIBCLANG_BUILD_STATIC=ON \
 -DLIBCXXABI_USE_LLVM_UNWINDER=YES -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-pc-linux-musl" \
 -G Ninja ../llvm

 
sed -i 's/-pedantic //g' build.ninja
sed -i 's/-pedantic-errors //g' build.ninja
sed -i 's/-Wall //g' build.ninja

# 
