#!/bin/bash

export LIBRARY_PATH=${PREFIX}/lib
export LD_LIBRARY_PATH=${PREFIX}/lib
export CPP_INCLUDE_PATH=${PREFIX}/include
export CPLUS_INCLUDE_PATH=${PREFIX}/include
export CXX_INCLUDE_PATH=${PREFIX}/include

if [ "$(uname)" == "Darwin" ]; then
  sed -i.bak 's/-Wl,-Bstatic//' Makefile.nongs
  sed -i.bak 's/-Wl,-Bdynamic -lrt//' Makefile.nongs
fi
if [ `uname -m` == "aarch64" ];then
  sed -i.bak "s/-msse4.2//" Makefile.nongs
  sed -i.bak 's/smmintrin.h/sse2neon\/sse2neon.h/' guidedassembler.hpp
fi

LDFLAGS=-L${PREFIX}/lib

make -f Makefile.nongs \
    BOOST_PATH=${PREFIX} \
    CC="$CXX $CXXFLAGS" \
    LDFLAGS=$LDFLAGS

mkdir -p ${PREFIX}/bin
mv skesa ${PREFIX}/bin/
mv saute ${PREFIX}/bin/
mv saute_prot ${PREFIX}/bin/
mv gfa_connector ${PREFIX}/bin/
mv kmercounter ${PREFIX}/bin/
