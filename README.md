This project showcases building three simple applications for the raspberry pi, cross-compiling them using cmake:
- **write-file** prints a short message to the console and to a file. This is the simplest example, with no dependencies.
- **hello-asound** prints the version of alsa on the system. The example demonstrates linking to a library installed on the system.
- **hello-portaudio** tries to initialize portaudio. Another example of linking to a library, the difference this one is installed to `/usr/lib`.

Cross compilation has been tested on a linux machine as the host, and a Raspberry Pi 2 model B with Raspbian Stretch Lite as the target.

## Howto:

1) Grab the compilers from https://github.com/raspberrypi/tools and put them somewhere on the host machine
2) Install the needed dependencies on the rpi: `apt install libasound-dev libportaudio-dev`
3) Mount the rpi filesystem locally on the host machine with `sshfs` (the cross-compilers will then be able to look for the dependencies in the mounted directory)
4) Provide the locations for the rpi-tools (see point 1) and the target sysroot (see point 3) to the `rpi-toolchain.cmake` script, by creating a `toolchain-locations.cmake` script with the definitions of the needed variables (see `toolchain-locations-example.cmake` for an example). Remember to **never add** `toolchain-locations.cmake` to version control.
5) Run cmake, providing the toolchain file, eg: `mkdir build`, then `cd build` and `cmake ../ -DCMAKE_TOOLCHAIN_FILE=../rpi-toolchain.cmake`
6) If the cmake step succeded, build the applications with `make` (you can also compile only one of the applications, eg: `make write-file`).
7) Copy the compiled executables to the mounted rpi filesystem, for example in the `pi` user home dir.
8) Open an ssh console session and launch the executable on the rpi.

## Notes:
- The setup/deployment process can be automated, and one nice way is using Qt-creator, which works well with cmake and can define kits for cross compilation and deployment to a remote device.
- You can even build these examples on the rpi itself, you will of course need to install the dependencies but you won't otherwise need to provide a cmake toolchain file.

