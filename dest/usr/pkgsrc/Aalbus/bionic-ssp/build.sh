#!/bin/sh
clang -fPIC -c ssp.c -o ssp.o
llvm-ar rc libssp-bionic.a ssp.o
