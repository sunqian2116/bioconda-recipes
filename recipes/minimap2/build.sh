#!/bin/bash
set -x
mkdir -p $PREFIX/bin $PREFIX/lib $PREFIX/include

export CPATH=${PREFIX}/include
sed -i "1c CFLAGS=		-g -Wall -O2 -Wc++-compat -L$PREFIX/lib" Makefile
sed -i "3c INCLUDES=-I$PREFIX/include" Makefile
make arm_neon=1 aarch64=1 minimap2 sdust
cp minimap2 misc/paftools.js $PREFIX/bin
cp sdust $PREFIX/bin
cp libminimap2.a $PREFIX/lib
cp *.h $PREFIX/include

