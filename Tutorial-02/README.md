# [02] Library Project
[+](./CMakeLists.txt)

## Build Procedure
- Configure: `cmake -S . -B Build`
- Build: `cmake --build Build`

## CMakeLists.txt
- [project()](https://cmake.org/cmake/help/latest/command/project.html)
- [add_library()](https://cmake.org/cmake/help/latest/command/add_library.html)
  - STATIC
  - SHARED
  - targets: `cmake --build Build --target help`
- [target_include_directories()](https://cmake.org/cmake/help/latest/command/target_include_directories.html)
  - PRIVATE
- [target_link_libraries()](https://cmake.org/cmake/help/latest/command/target_link_libraries.html)
- [set_target_properties()](https://cmake.org/cmake/help/latest/command/set_target_properties.html)
  - [OUTPUT_NAME](https://cmake.org/cmake/help/latest/prop_tgt/OUTPUT_NAME.html)


[-](../README.md)