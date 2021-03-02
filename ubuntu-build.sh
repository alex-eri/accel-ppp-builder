#!/bin/bash
. /etc/profile

[ -e accel-ppp ] || git clone https://github.com/xebd/accel-ppp.git accel-ppp

pushd accel-ppp
git pull
popd

rm -rf build deb
mkdir -p build
mkdir -p deb

pushd build/
cmake ../accel-ppp/ .
cmake --build .
export CPACK_DEBIAN_PACKAGE_DEPENDS="$(cat /scripts/ubuntu-deps-runtime)"
cpack -G DEB
for file in *.deb; do
    mv "$file" ../deb/"${file%.deb}_ubuntu.deb"
done
popd
