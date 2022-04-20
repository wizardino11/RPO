# Install script for directory: /home/miracle-/Projects/libs/mbedtls/mbedtls/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/home/miracle-/Android/Sdk/ndk/24.0.8215888/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/aes.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/aria.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/asn1.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/asn1write.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/base64.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/bignum.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/build_info.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/camellia.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ccm.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/chacha20.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/chachapoly.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/check_config.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/cipher.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/cmac.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/compat-2.x.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/config_psa.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/constant_time.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ctr_drbg.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/debug.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/des.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/dhm.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ecdh.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ecdsa.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ecjpake.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ecp.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/entropy.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/error.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/gcm.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/hkdf.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/hmac_drbg.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/mbedtls_config.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/md.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/md5.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/net_sockets.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/nist_kw.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/oid.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/pem.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/pk.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/pkcs12.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/pkcs5.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/platform.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/platform_time.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/platform_util.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/poly1305.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/private_access.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/psa_util.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ripemd160.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/rsa.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/sha1.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/sha256.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/sha512.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ssl.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ssl_cache.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ssl_cookie.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/ssl_ticket.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/threading.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/timing.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/version.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/x509.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/x509_crl.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/x509_crt.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/mbedtls/x509_csr.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_builtin_composites.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_builtin_primitives.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_compat.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_config.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_driver_common.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_driver_contexts_composites.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_driver_contexts_primitives.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_extra.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_platform.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_se_driver.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_sizes.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_struct.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_types.h"
    "/home/miracle-/Projects/libs/mbedtls/mbedtls/include/psa/crypto_values.h"
    )
endif()

