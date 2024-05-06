#!/bin/bash

cd src

if [[ ${target_platform} =~ osx.* ]]; then
make -f Makefile.MacOS OUR_CC="${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}"
else
sed -i '/-mtune=core2/c \ CCFLAGS = -mtune=generic ${MACOS} -O9 -Wall -D VERSE_VERSION=\\\"${VERSE_VERSION}\\\" -D_FILE_OFFSET_BITS=64' $SRC_DIR/src/Makefile.Linux
sed -i '/-mmmx -msse -msse2 -msse3/c \ CC = gcc ${CCFLAGS} -ggdb -fomit-frame-pointer -ffast-math -funroll-loops -fmessage-length=0' $SRC_DIR/src/Makefile.Linux

#solve some warnings -Wunused-but-set-variable

make -f Makefile.Linux OUR_CC="${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}"
fi

install -d "${PREFIX}/bin"
install ../verse "${PREFIX}/bin/"
