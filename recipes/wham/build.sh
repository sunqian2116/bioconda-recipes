#!/bin/bash
export LIBRARY_PATH=${PREFIX}/lib
export C_INCLUDE_PATH=${PREFIX}/include
export CPP_INCLUDE_PATH=${PREFIX}/include
export CXX_INCLUDE_PATH=${PREFIX}/include
export CPLUS_INCLUDE_PATH=${PREFIX}/include

# I have prepared the "sse2neon-master" source code, And put it in the "/root" directory,If you are not prepared, please execute the following command
# wget https://github.com/DLTcollab/sse2neon/archive/refs/heads/master.zip -O /root/sse2neon-master.zip --no-ch
# I have prepared the "wham" source code, And put it in the "/root" directory,If you are not prepared, please execute the following command
# git clone --recursive https://github.com/zeeev/wham.git /root/wham

unzip /root/sse2neon-master.zip
cp sse2neon-master/sse2neon.h src/Complete-Striped-Smith-Waterman-Library/src/sse2neon.h
cp sse2neon-master/sse2neon.h src/lib/sse2neon.h
sed -i '9c\#include "sse2neon.h"' src/Complete-Striped-Smith-Waterman-Library/src/main.c
sed -i '38c\#include "sse2neon.h"' src/Complete-Striped-Smith-Waterman-Library/src/ssw.c 
sed -i '17c\#include "sse2neon.h"' src/Complete-Striped-Smith-Waterman-Library/src/ssw.h
sed -i '38c\#include "sse2neon.h"' src/lib/ssw.c

sed -i.bak '/^CC=/s/^/#/g' Makefile
sed -i.bak '/^CXX=/s/^/#/g' Makefile
sed -i.bak 's#cmake ..#cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_CXX_COMPILER=${CXX} -DCMAKE_INSTALL_INCLUDEDIR=${PREFIX}/include -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib ..#' Makefile
sed -i.bak 's/$(LIBS)/-L${LIBRARY_PATH} -I${C_INCLUDE_PATH} ${LIBS}/g' Makefile
sed -i.bak '/^CC =/s/^/#/g' src/Complete-Striped-Smith-Waterman-Library/src/Makefile
sed -i.bak '/^CXX =/s/^/#/g' src/Complete-Striped-Smith-Waterman-Library/src/Makefile
sed -i.bak '/^CXX=/s/^/#/g' src/fastahack/Makefile
sed -i.bak 's/-lm -lz/-L${LIBRARY_PATH} -I${C_INCLUDE_PATH} -lm -lz/' src/Complete-Striped-Smith-Waterman-Library/src/Makefile

make
mkdir -p $PREFIX/bin
cp bin/* $PREFIX/bin
