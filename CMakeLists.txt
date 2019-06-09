cmake_minimum_required(VERSION 3.14)
set(CMAKE_CXX_STANDARD 11)

project(hello-rpi)

message("LIBRARIES now in: ${CMAKE_SYSTEM_LIBRARY_PATH}")


add_executable(write-file write-file.cpp)

add_executable(hello-portaudio hello-portaudio.cpp)
find_library(portaudio_lib NAMES portaudio)
target_link_libraries(hello-portaudio PRIVATE ${portaudio_lib})

add_executable(hello-asound hello-asound.cpp)
find_library(asound_lib NAMES asound)
target_link_libraries(hello-asound PRIVATE ${asound_lib})

