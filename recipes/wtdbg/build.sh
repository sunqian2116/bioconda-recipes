#!/bin/bash

export CFLAGS=-I$PREFIX/include
export CXXFLAGS=-I$PREFIX/include
export LDFLAGS=-L$PREFIX/lib

sed -i '28,29c\#include <sse2neon/sse2neon.h>' poacns.h
sed -i '28c\#include <sse2neon/sse2neon.h>' ksw.c	

mkdir -p $PREFIX/bin

make CC=${CC} CFLAGS="${CFLAGS} -L${PREFIX}/lib"  CXX=${CXX} CXXFLAGS="${CXXFLAGS} -L${PREFIX}/lib" LDFLAGS="${LDFLAGS}"

cp wtdbg2 wtdbg-cns wtpoa-cns $PREFIX/bin
