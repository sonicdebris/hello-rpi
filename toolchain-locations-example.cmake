# Use this file as a reference to create toolchain-locations.cmake,
# that will be used by rpi-toolchain.cmake to know the locations
# of the compilers and libraries.

# Remember NOT to add toolchain-locations.cmake to version control,
# So that locations can be set-up independently by different developers
# on different machines

# Root path for the raspberry-pi tools, get them at:
# https://github.com/raspberrypi/tools

set(RPI_TOOLS_DIR /home/user/path/to/rpi-tools)

# rpi fs root - mount it with sshfs:
# EG:
# mkdir /home/user/rpi_sysroot 
# sshfs user@ip.of.the.rpi:/ /home/user/rpi_sysroot -o transform_symlinks

set(RPI_SYSROOT_DIR /home/user/rpi_sysroot)
