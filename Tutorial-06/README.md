# Non-CMake dependency and find_package(): Module Mode

## Build Procedure
- Build SDL
  - `cmake -S . -B Build -D CMAKE_INSTALL_PREFIX=../install/SDL`
  - `cmake --build Build --target install`
- Build imgui (cd externals/imgui-cmake)
  - `cmake -S . -B Build -D SDL2_ROOT=../install/SDL`
  - `cmake --build Build`
- Configure: `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release -D SDL2_ROOT=../externals/install/SDL`
- Build: `cmake --build Build --verbose`

## CMakeLists.txt
- [add_subdirectory()](https://cmake.org/cmake/help/latest/command/add_subdirectory.html)
  - Out-of-tree source: \<binary_dir\>
- [find_package()](https://cmake.org/cmake/help/latest/command/find_package.html)
  - `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release -D SDL2_ROOT=../externals/install/SDL --debug-find-pkg=imgui`
  - Search modes:
    - [Config mode](https://cmake.org/cmake/help/latest/command/find_package.html#config-mode-search-procedure)
    - Module mode
      - [CMAKE_MODULE_PATH](https://cmake.org/cmake/help/latest/variable/CMAKE_MODULE_PATH.html)
      - Find\<PackageName\>.cmake: [*Findimgui.cmake*](./cmake/modules/Findimgui.cmake)
      - [find_path()](https://cmake.org/cmake/help/latest/command/find_path.html)
      - [find_library()](https://cmake.org/cmake/help/latest/command/find_library.html)
      - [set_target_properties()](https://cmake.org/cmake/help/latest/command/set_target_properties.html)
        - [INTERFACE_INCLUDE_DIRECTORIES](https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_INCLUDE_DIRECTORIES.html)
        - [INTERFACE_LINK_LIBRARIES](https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_LINK_LIBRARIES.html)
        - [other target properties](https://cmake.org/cmake/help/latest/manual/cmake-properties.7.html#target-properties)
      - [FindPackageHandleStandardArgs](https://github.com/Kitware/CMake/blob/master/Modules/FindPackageHandleStandardArgs.cmake): [find_package_handle_standard_args()](https://cmake.org/cmake/help/latest/module/FindPackageHandleStandardArgs.html)

