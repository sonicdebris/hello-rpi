# Toolchain definition file for cross-compilation with a raspberry pi as a target
# Heavily based on the one at:
# https://redmine.emweb.be/projects/wt/wiki/Cross_compile_Wt_on_Raspberry_Pi2

# provide the toolchain when launching cmake, like this:
# cmake /path/to/cmakelists -DCMAKE_TOOLCHAIN_FILE=/path/to/rpi-toolchain.cmake

# NB: You DON'T need to indicate the toolchain when building on the rpi itself
# NB2: This script assumes that the target sysroot is mounted locally with sshfs

SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

# Create toolchain-locations.cmake with paths to rpi-tools and target sysroot.
# See toolchain-locations-example.cmake for more info

include(${CMAKE_CURRENT_LIST_DIR}/toolchain-locations.cmake)

# Setup compilers:

set(RPI_COMPILERS_DIR ${RPI_TOOLS_DIR}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin) 
set(CMAKE_C_COMPILER ${RPI_COMPILERS_DIR}/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${RPI_COMPILERS_DIR}/arm-linux-gnueabihf-g++)

# Where is the target environment, mounted with sshfs:

set(CMAKE_FIND_ROOT_PATH ${RPI_SYSROOT_DIR})
set(CMAKE_SYSROOT ${RPI_SYSROOT_DIR})

# Search for programs in the build host directories:

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# For libraries and headers in the target directories:

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
