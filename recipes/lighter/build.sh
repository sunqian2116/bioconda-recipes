#!/bin/sh

mkdir -p $PREFIX/bin
if [ `uname -m` == "aarch64" ]; then
  make CXX=${CXX} CXXFLAGS="${CXXFLAGS} -fsigned-char" LDFLAGS="${LDFLAGS}"
else
  make CXX=${CXX} CXXFLAGS="${CXXFLAGS}" LDFLAGS="${LDFLAGS}"
fi
cp lighter $PREFIX/bin
