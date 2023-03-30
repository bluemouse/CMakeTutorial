# [01] Executable Project
[+](./CMakeLists.txt)

## Build Procedure
- Configure: `cmake -S . -B Build [-G <generator>]`
- Configure: `cd Build; cmake .. [-G <generator>]`
- Build: `cmake --build Build [-j jobs] [-v]`
- [cmake](https://cmake.org/cmake/help/latest/manual/cmake.1.html)
  - [cmake buildsystem](https://cmake.org/cmake/help/latest/manual/cmake.1.html#introduction-to-cmake-buildsystems)
    - Source tree: `-S <path-to-source>`
    - Build tree: `-B <path-to-build>`
    - [Generator](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html)(native build system): `-G <generator>`
      - `cmake -S . -B Build -G "Ninja"`
        - "Unix Makefiles"
        - "Visual Studio 16 2019"
        - "Xcode'
  - verbose: `cmake --build Build -v`


## CMakeLists.txt
- [project()](https://cmake.org/cmake/help/latest/command/project.html)
- [set()](https://cmake.org/cmake/help/latest/command/set.html)
- [add_executable()](https://cmake.org/cmake/help/latest/command/add_executable.html)
- [message()](https://cmake.org/cmake/help/latest/command/message.html)
  - STATUS
  - FATAL_ERROR
- [CMakePrintHelpers](https://github.com/Kitware/CMake/blob/master/Modules/CMakePrintHelpers.cmake): [cmake_print_variables()](https://cmake.org/cmake/help/latest/module/CMakePrintHelpers.html)



[-](../README.md)