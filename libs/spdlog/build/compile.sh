#!/bin/bash
#ABI="arnaebi-v7a"
#ABI=x86
#ABI="arn64-v8a"
ABI="x86_64"

mkdir -p ${ABI}
cd ${ABI}

cmake ../../spdlog -DCMAKE_SYSTEM_NAME=Android -DCMAKE_SYSTEM_VERSION=21 -DANDROID_ABI=${ABI} -DCMAKE_TOOLCHAIN_FILE=/home/miracle-/Android/Sdk/ndk/24.0.8215888/build/cmake/android.toolchain.cmake -DCMAKE_CXX_FLAGS=-DSPDLOG_COMPILED_LIB

cmake --build .

#-DCMAKE_CXX_COMPILER=/usr/bin/c++
