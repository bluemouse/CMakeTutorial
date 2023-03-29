
## Build Procedure
- configure: `cmake -S . -B Build`
- build: `cmake --build Build`

## CMakeLists.txt
- [project()](https://cmake.org/cmake/help/latest/command/project.html)
- [add_library()](https://cmake.org/cmake/help/latest/command/add_library.html)
  - STATIC
  - SHARED
  - targets: *cmake --build Build --target help*
  - [generators](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html)(native build system): *cmake -S . -B Build -G "Ninja"*
    - "Unix Makefiles"
    - "Visual Studio 16 2019"
    - "Xcode'
  - verbose: *cmake --build Build --verbose*
- [target_include_directories()](https://cmake.org/cmake/help/latest/command/target_include_directories.html)
  - PRIVATE
- [target_link_libraries()](https://cmake.org/cmake/help/latest/command/target_link_libraries.html)
- [set_target_properties()](https://cmake.org/cmake/help/latest/command/set_target_properties.html)
  - [OUTPUT_NAME](https://cmake.org/cmake/help/latest/prop_tgt/OUTPUT_NAME.html)

