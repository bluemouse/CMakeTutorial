# [06] Non-CMake dependency and find_package(): Module Mode
#### [[main] CMakeLists.txt](./CMakeLists.txt)
#### [[applications] CMakeLists.txt](./applications/Pallet/CMakeLists.txt)
#### [[imgui-cmake] CMakeLists.txt](../externals/imgui-cmake/CMakeLists.txt)

<br>

## Build Procedure
- Build SDL (*cd externals/SDL*)
  - `cmake -S . -B Build -D CMAKE_INSTALL_PREFIX=../install/SDL`
  - `cmake --build Build --target install -j 8`
- Build imgui (*cd externals/imgui-cmake*)
  - `cmake -S . -B Build -D SDL2_ROOT=../install/SDL`
  - `cmake --build Build -j 8`
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

## Notes
- [Application](./applications/Pallet/src/main.cpp)
  - Dependencies
    - imgui
    - SDL2
    - Vulkan
    - Pokemons
- Build **SDL**
- Build **imgui**: external cmake folder
  - [CMakeLists.txt](../externals/imgui-cmake/CMakeLists.txt)
  - Dependencies
    - SDL2: user installed library.
    - Vulkan: system installed library
- Out-of-source subdirectory
  - Work nicely as git submodule
- [find_package()](https://cmake.org/cmake/help/latest/command/find_package.html): module mode
  - Find\<PackageName\>.cmake: [*Findimgui.cmake*](./cmake/modules/Findimgui.cmake)
    - [add_library()](https://cmake.org/cmake/help/latest/command/add_library.html)
      - **UNKNOWN**: *It allows the path to an imported library (often found using the find_library() command) to be used without having to know what type of library it is*
      - [**IMPORTED**](https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html#:~:text=In%20the%20CMakeLists%20file%2C%20use,will%20be%20set%20to%20true%20.): *IMPORTED targets are used to convert files outside of a CMake project into logical targets inside of the project.*
    - [find_path()](https://cmake.org/cmake/help/latest/command/find_path.html)
    - [find_library()](https://cmake.org/cmake/help/latest/command/find_library.html)
      - *Each library name given to the NAMES option is first considered as a library file name and then considered with platform-specific prefixes (e.g. lib) and suffixes (e.g. .so).*
      - [CMAKE_FIND_LIBRARY_PREFIXES](https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_LIBRARY_PREFIXES.html)
      - [CMAKE_FIND_LIBRARY_SUFFIXES](https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_LIBRARY_SUFFIXES.html)
    - [INTERFACE_INCLUDE_DIRECTORIES](https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_INCLUDE_DIRECTORIES.html)
    - [INTERFACE_LINK_LIBRARIES](https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_LINK_LIBRARIES.html)
- Print target properties
  - [PrintTargetProperties](./cmake/PrintTargetProperties.cmake): print_target_properties

[-](../README.md)