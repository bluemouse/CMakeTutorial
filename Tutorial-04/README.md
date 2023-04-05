# [04] Sub-project, Target and Transitive Scope
#### [[main] CMakeLists.txt](./CMakeLists.txt)
#### [[applications] CMakeLists.txt](./applications/Pallet/CMakeLists.txt)

<br>

## Build Procedure
- Configure: `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release -D ENABLE_KALOS_REGION=ON`
- Build: `cmake --build Build --verbose`

## CMakeLists.txt
- [add_subdirectory()](https://cmake.org/cmake/help/latest/command/add_subdirectory.html)
- [scope](https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#target-usage-requirements): [PRIVATE/PUBLIC/INTERFACE](https://stackoverflow.com/questions/26243169/cmake-target-include-directories-meaning-of-scope)
  - [target_compile_definitions()](https://cmake.org/cmake/help/latest/command/target_include_directories.html)
  - [target_compile_features()](https://cmake.org/cmake/help/latest/command/target_compile_features.html)
  - [target_link_libraries()](https://cmake.org/cmake/help/latest/command/target_link_libraries.html)
  - [target_link_options()](https://cmake.org/cmake/help/latest/command/target_link_options.html)

- [target alias](https://cmake.org/cmake/help/latest/command/add_library.html#alias-libraries)

## Notes
### Project Structure
### Targets
- *A CMake-based buildsystem is organized as a set of high-level logical targets. Each target corresponds to an executable or library, or is a custom target containing custom commands.*
### [Target Properties](https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#target-properties)
- Path to the library headers [INCLUDE_DIRECTORIES](https://cmake.org/cmake/help/latest/prop_tgt/INCLUDE_DIRECTORIES.html).
- Path to the library binaries.
- Name of the library binaries.
- Compiler/linker flags [COMPILE_DEFINITIONS](https://cmake.org/cmake/help/latest/prop_tgt/COMPILE_DEFINITIONS.html), [COMPILE_OPTIONS](https://cmake.org/cmake/help/latest/prop_tgt/COMPILE_OPTIONS.html).
### Usage Requirements (information you need from dependencies)
- *Target properties that specify content which consumers must use to correctly compile and link with the target they appear on.*
<!-- - INTERFACE_INCLUDE_DIRECTORIES -->
<!-- - INTERFACE_COMPILE_DEFINITIONS -->
<!-- - INTERFACE_COMPILE_OPTIONS -->

### [Transitive Usage Requirements](https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#transitive-usage-requirements)
- PRIVATE
- PUBLIC
- INTERFACE

[-](../README.md)