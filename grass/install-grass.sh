#!/bin/bash
# Install GRASS GIS.

GRASS_DIR=grass-src
PREFIX=/usr/local

# Install into a conda env: `bash install-grass.sh -p $CONDA_PREFIX``
help() {
    echo -e "Usage: install-grass [-p] [-h]"
    exit 0
}

while getopts ":hp:" option; do
   case $option in
      h)
         help
         ;;
      p)
         PREFIX=$OPTARG
         ;;
     \?)
         echo "Error: Invalid option"
         help
         ;;
   esac
done

if [ ! -d $GRASS_DIR ]; then
    git clone --depth 1 --branch 8.3.1 https://github.com/OSGeo/grass.git $GRASS_DIR
fi

pushd $GRASS_DIR

./configure \
    --prefix=$PREFIX \
    --with-libs=$PREFIX/lib \
    --with-includes=$PREFIX/include \
    --enable-largefile=yes \
    --with-nls \
    --with-cxx \
    --with-readline \
    --with-bzlib \
    --with-pthread \
    --with-geos=$PREFIX/bin/geos-config \
    --with-cairo \
    --without-opengl \
    --with-freetype \
    --with-sqlite \
    --with-pdal \
    --with-openmp \
    --with-zstd

if [ $? == 0 ]; then
    make
    make install
fi

popd
exit 0
