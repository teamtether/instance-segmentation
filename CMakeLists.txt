cmake_minimum_required(VERSION 2.8.12)
project(instance_segmentation)

add_subdirectory(dlib dlib_build)

macro(add_example name)
   add_executable(${name} src/${name}.cpp)
   target_link_libraries(${name} dlib::dlib)
endmacro()

add_example(instance_segmentation)

