# [05] Dependency and find_package(): Config Mode
#### [[main] CMakeLists.txt](./CMakeLists.txt)
#### [[applications] CMakeLists.txt](./applications/Pallet/CMakeLists.txt)


<br>

## Build Procedure
- Build SDL
  - `cmake -S . -B Build -D CMAKE_INSTALL_PREFIX=../install/SDL`
  - `cmake --build Build --target install`
- Configure: `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release -D SDL2_ROOT=../externals/install/SDL`
- Build: `cmake --build Build --verbose`

## CMakeLists.txt
- [find_package()](https://cmake.org/cmake/help/latest/command/find_package.html)
  - `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release -D SDL2_ROOT=../externals/install/SDL --debug-find-pkg=SDL2`
  - Package properties:
    - [IMPORTED Targets](https://cmake.org/cmake/help/latest/module/FindVulkan.html#imported-targets)
    - [Result Variables](https://cmake.org/cmake/help/latest/module/FindVulkan.html#result-variables)
    - [FindPackageVerbose](./cmake/FindPackageVerbose.cmake): *find_package_verbose*
      - \<PackageName\>_FOUND: *SDL2_FOUND*, *Vulkan_FOUND*
      - \<PackageName\>_INCLUDE_DIRS: *SDL2_INCLUDE_DIRS*, *Vulkan_INCLUDE_DIRS*
      - \<PackageName\>_LIBRARIES: *SDL2_LIBRARIES*, *Vulkan_LIBRARIES*
      - \<PackageName\>::\<PackageName\>: *SDL2::SDL2*, *Vulkan::Vulkan*
  - Search modes:
    - [Config mode](https://cmake.org/cmake/help/latest/command/find_package.html#config-mode-search-procedure)
      - \<PackageName\>_ROOT: *SDL2_ROOT*
      - [CMAKE_PREFIX_PATH](https://cmake.org/cmake/help/latest/envvar/CMAKE_PREFIX_PATH.html)
      - \<PackageName\>_DIR: *SDL2_DIR*
      - \<PackageName\>Config.cmake: [SDL2Config.cmake](../externals/install/SDL/lib/cmake/SDL2/SDL2Config.cmake)
    - Module mode
      - [CMAKE_MODULE_PATH](https://cmake.org/cmake/help/latest/variable/CMAKE_MODULE_PATH.html)
      - Find\<PackageName\>.cmake: *FindSDL2.cmake*
- [include()](https://cmake.org/cmake/help/latest/command/include.html)
  - [CMAKE_MODULE_PATH](https://cmake.org/cmake/help/latest/variable/CMAKE_MODULE_PATH.html)

## Notes
### CMake Ecosystem
### Inspect a Package
- Read documentation (if there is one): [FindVulkan](https://cmake.org/cmake/help/latest/module/FindVulkan.html)
- Read package configuration file: [SDL2Config.cmake](../externals/install/SDL/lib/cmake/SDL2/SDL2Config.cmake)
- [FindPackageVerbose](./cmake/FindPackageVerbose.cmake): *find_package_verbose*
  - `include` a module

### Search Path?
- `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release -D SDL2_ROOT=../externals/install/SDL --debug-find-pkg=SDL2`

[-](../README.md)