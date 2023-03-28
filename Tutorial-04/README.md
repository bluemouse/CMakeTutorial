
## Build Procedure
- configure: `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release`
- build: `cmake --build Build --verbose`

## CMakeLists.txt
- [add_subdirectory()](https://cmake.org/cmake/help/latest/command/add_subdirectory.html)
- [target_link_libraries()](https://cmake.org/cmake/help/latest/command/target_link_libraries.html)
  - [scope](https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#target-usage-requirements): [PRIVATE/PUBLIC/INTERFACE](https://stackoverflow.com/questions/26243169/cmake-target-include-directories-meaning-of-scope)
- [target alias](https://cmake.org/cmake/help/latest/command/add_library.html#alias-libraries)

