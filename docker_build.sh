#!/bin/bash
board="CubeBlack"
commit=$(git rev-parse --short HEAD)
date=$(date +%F)

echo "Starting Build Process"
git clone https://github.com/haggis-aerospace/ardupilot ardupilot_docker
cd ardupilot_docker
git submodule update --init --recursive

make $board

mkdir -p Release/$board/$date/$commit
echo "Build Complete"
cp build/$board/bin/* Release/$board/$date/$commit/
echo "Cleaning"
make clean
exit
