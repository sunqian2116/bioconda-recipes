# Install as plink
export CFLAGS="-Wall -O2 -g -I../2.0/simde"
export CXXFLAGS="-Wall -O2 -g -I../2.0/simde"
export LDFLAGS="-lm -lpthread -ldl"
cd 1.9
make
mkdir -p $PREFIX/bin
cp plink $PREFIX/bin/plink
