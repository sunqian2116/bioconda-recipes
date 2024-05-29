#!/bin/bash
mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
mkdir -p ~/.R
echo -e "CC=$CC
FC=$FC
CXX=$CXX
CXX98=$CXX
CXX11=$CXX
CXX14=$CXX" > ~/.R/Makevars
sed -i 's/-Wl,--no-whole-archive/-Wl,--no-whole-archive -lpthread/g' $SRC_DIR/src/Makevars
$R CMD INSTALL --build .
