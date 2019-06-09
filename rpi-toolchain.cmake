SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

include(${CMAKE_CURRENT_LIST_DIR}/toolchain-locations.cmake)
# create toolchain-locations.cmake with paths to rpi-tools and sysroot
# mount the sysroot with sshfs first:
# sshfs user@ip.of.the.rpi:/ /where/to/mount -o transform_symlinks
set(RPI_COMPILERS_DIR ${RPI_TOOLS_DIR}/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin)
 
set(CMAKE_C_COMPILER ${RPI_COMPILERS_DIR}/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${RPI_COMPILERS_DIR}/arm-linux-gnueabihf-g++)

# where is the target environment - we mounted it using sshfs
SET(CMAKE_FIND_ROOT_PATH ${RPI_SYSROOT_DIR})

message("LIBRARIES in: ${CMAKE_SYSTEM_LIBRARY_PATH}")

link_directories(
    ${RPI_SYSROOT_DIR}/usr/lib/arm-linux-gnueabihf
)

include_directories(
    ${RPI_SYSROOT_DIR}/usr/include/arm-linux-gnueabihf
    ${RPI_SYSROOT_DIR}/usr/include
)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
