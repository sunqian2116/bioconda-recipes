#!/bin/bash

pushd codes
mkdir -p $PREFIX/bin/
chmod +x *py
cp *py $PREFIX/bin/
chmod +x *sh
cp *sh $PREFIX/bin/
popd
