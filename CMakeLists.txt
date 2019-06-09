cmake_minimum_required(VERSION 3.7)
set(CMAKE_CXX_STANDARD 11)

project(hello-rpi)

# A simple program that writes to file:

add_executable(write-file write-file.cpp)

# A simple program that prints the version of alsa installed on the system:
# You'll need to apt install libasound-dev to correctly link to it:

add_executable(hello-asound hello-asound.cpp)
find_library(asound_lib NAMES asound)
target_link_libraries(hello-asound PRIVATE ${asound_lib})

# A simple program that only initializes portaudio:
# You'll need to apt install libportaudio-dev to correctly link to it:

add_executable(hello-portaudio hello-portaudio.cpp)
find_library(portaudio_lib NAMES portaudio)
target_link_libraries(hello-portaudio PRIVATE ${portaudio_lib})
