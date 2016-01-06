#!/usr/bin/env bash

set -e

# C/C++
mkdir -p /tmp/ycm_build
echo -n "cd " && pushd /tmp/ycm_build
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=/usr/local/opt/llvm/lib/libclang.dylib . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_support_libs --config Release
make -j
echo -n "cd " && popd

# Go
echo -n "cd " && pushd third_party/ycmd/third_party/gocode
go build
echo -n "cd " && popd

# Javascript
echo -n "cd " && pushd third_party/ycmd/third_party/tern
npm install --production
echo -n "cd " && popd
