#!/bin/bash

export CFLAGS="$CFLAGS -I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"
export LIBRARY_PATH="${PREFIX}/lib"
export CPATH="${PREFIX}/include"

sed -i.bak 's/^GIT_HEADER/#GIT_HEADER/' makefile
sed -i "16s%=%=-L\$\{BUILD_PREFIX\}/lib%" makefile
make CXX=$CXX ARM=false

mkdir -p $PREFIX/bin
cp atlas $PREFIX/bin 
