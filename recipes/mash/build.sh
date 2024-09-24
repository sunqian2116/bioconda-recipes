#!/bin/bash

OS=$(uname)
if [[ "$OS" == "Darwin" ]]; then
    echo ""
else
    #libkj.a needs to link against librt
    sed -i.bak "s/pthread/pthread -lrt/g" Makefile.in
fi

./bootstrap.sh
./configure --with-capnp=$PREFIX --with-gsl=$PREFIX --prefix=$PREFIX
make
make install
