#!/bin/bash
board="CubeBlack"
commit=$(git rev-parse --short HEAD)
date=$(date +%F)

echo "Starting Build Process"

make $board

mkdir -p Release/$board/$date/$commit
echo "Build Complete"
cp build/$board/bin/* Release/$board/$date/$commit/
echo "Cleaning"
make clean
exit
