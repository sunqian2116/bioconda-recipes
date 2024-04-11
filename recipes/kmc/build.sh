#!/bin/bash

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include

cp bin/kmc $PREFIX/bin
cp bin/kmc_dump $PREFIX/bin
cp bin/kmc_tools $PREFIX/bin
cp bin/libkmc_core.a $PREFIX/lib
cp include/kmc_runner.h $PREFIX/include

