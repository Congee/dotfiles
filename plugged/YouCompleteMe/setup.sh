#!/bin/sh

set -u

pushd() {
	echo Entering "$1"
	cd "$1" || exit 1
}

popd() {
	echo Leaving "$PWD"
	cd "$OLDPWD" || exit 1
}

#BOOST="-DUSE_SYSTEM_BOOST=ON"
LIBCLANG="-DEXTERNAL_LIBCLANG_PATH=/usr/local/opt/llvm/lib/libclang.dylib"

mkdir ycm_build
pushd ycm_build
cmake -G "Unix Makefiles" $LIBCLANG . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_support_libs --config Release
popd

pushd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/gocode
go build .
popd

pushd ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/tern/
npm install --production
popd
