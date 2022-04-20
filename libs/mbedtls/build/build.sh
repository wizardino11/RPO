#!/bin/bash
#ABI="arnaebi-v7a"
#ABI=x86
#ABI="arn64-v8a"
#ABI="x86_64"

#mkdir -p ${ABI}
#cd ${ABI}

#cmake ../../mbedtls -DCMAKE_SYSTEM_NAME=Android -DCMAKE_SYSTEM_VERSION=21 -DANDROID_ABI=${ABI} -DCMAKE_TOOLCHAIN_FILE= /home/miracle-/Android/Sdk/ndk/24.0.8215888/build/cmake/android.toolchain.cmake -DUSE_SHARED_MBEDTLS_LIBRARY=On -DENABLE_TESTING=Off

#cmake --build .





#!/bin/bash
#ABI=armaebi-v7a
#ABI=x86
#ABI=arm64-v8a
ABI=x86_64
TOOL_CHAIN=/home/miracle-/Android/Sdk/ndk/24.0.8215888/build/cmake/android.toolchain.cmake

mkdir -p ${ABI}
cd ${ABI}

cmake ../../mbedtls -DCMAKE_SYSTEM_NAME=Android -DCMAKE_SYSTEM_VERSION=21 \
-DANDROID_ABI=${ABI} -DCMAKE_TOOLCHAIN_FILE=${TOOL_CHAIN} \
-DUSE_SHARED_MBEDTLS_LIBRARY=On -DENABLE_TESTING=Off
cmake --build .
