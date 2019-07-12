#!/bin/bash
board="CubeBlack"
commit=$(git rev-parse --short HEAD)
date=$(date +%F)

pip install future
eval $(ssh-agent)
ssh-add /keys/id_rsa
mkdir ~/.ssh
ssh-keyscan github.com >> ~/.ssh/githubKey
ssh-keygen -lf ~/.ssh/githubKey
cat /ardupilot/.ssh/githubKey >> ~/.ssh/known_hosts

echo "Starting Build Process"
#git clone https://github.com/haggis-aerospace/ardupilot ardupilot_docker
#cd ardupilot_docker
#git submodule update --init --recursive

make $board

mkdir -p Release/$board/$date/$commit
echo "Build Complete"
cp build/$board/bin/* Release/$board/$date/$commit/
echo "Cleaning"
make clean
git add -A
git commit -m "Build pushed for commit $commit"
git push
exit
