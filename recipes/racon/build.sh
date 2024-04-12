#!/bin/bash

mkdir -p $PREFIX/bin
mkdir build
cd build
if [ `uname -m` == "aarch64" ]; then
        cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} -Dracon_build_wrapper=ON -Dspoa_optimize_for_portability=OFF ..
else
        cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} -Dracon_build_wrapper=ON -Dspoa_optimize_for_portability=ON ..
fi
make
chmod +w bin/racon_wrapper
make install
cp bin/racon_wrapper ${PREFIX}/bin
