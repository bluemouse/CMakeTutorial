
## Build Procedure
#### Makefile/Ninja
- configure: `cmake -S . -B Build -D CMAKE_BUILD_TYPE=Release -D ENABLE_KALOS_REGION=ON`
- build: `cmake --build Build`

#### Visual Studio
- configure: `cmake -S . -B Build  -D ENABLE_KALOS_REGION=ON`
- build: `cmake --build Build --config Release`

## CMakeLists.txt
- [option()](https://cmake.org/cmake/help/latest/command/option.html)
  - Print options: *cmake –LH Build*
  - Print all variables: *cmake –LA Build*
  - [cmake_dependent_option()](https://cmake.org/cmake/help/latest/module/CMakeDependentOption.html)
- [include()](https://cmake.org/cmake/help/latest/command/include.html)
- [list()](https://cmake.org/cmake/help/latest/command/list.html)
- [add_library()](https://cmake.org/cmake/help/latest/command/add_library.html)
  - OBJECT

