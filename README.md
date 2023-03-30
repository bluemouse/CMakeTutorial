## Learning CMake

[Modern CMake Tutorial​](https://cliutils.gitlab.io/modern-cmake/)

[Modern CMake for C++: Discover a better approach to building, testing, and packaging your software​](https://www.amazon.ca/Modern-CMake-Discover-approach-packaging/dp/1801070059/ref=sr_1_1?crid=1VMTWZ8HK951L&keywords=cmake&qid=1679068613&sprefix=cmake%2Caps%2C78&sr=8-1)

[CMake Reference Manuals​](https://cmake.org/cmake/help/latest/index.html)

- [cmake-language​](https://cmake.org/cmake/help/latest/manual/cmake-language.7.html#organization)
- [cmake-buildsystem​](https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#introduction)
- [cmake-package](https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html):  [*find_package()*](https://cmake.org/cmake/help/latest/command/find_package.html#command:find_package)
- [cmake-generator-expressions​](https://cmake.org/cmake/help/latest/manual/cmake-generator-expressions.7.html)

[CMake GitHub​](https://github.com/Kitware/CMake)



## Tutorials
- [Tutorial-01](./Tutorial-01/README.md): simple executable project
- [Tutorial-02](./Tutorial-02/README.md): simple library project
- [Tutorial-03](./Tutorial-03/README.md): option/variable/object library target
- [Tutorial-04](./Tutorial-04/README.md): sub project/target/transitive scope
- [Tutorial-05](./Tutorial-05/README.md): SDL2/find_package(): config mode
- [Tutorial-06](./Tutorial-06/README.md): imgui/out-of-source subdirectory/find_package(): module mode


## Best Practices
- [Do's and Don'ts](https://cliutils.gitlab.io/modern-cmake/chapters/intro/dodonot.html)
- [Effective Modern CMake](https://gist.github.com/mbinna/c61dbb39bca0e4fb7d1f73b0d66a4fd1)
- My suggestions:
  - Coding style:
    - Lowercase functions (convention)
    - Uppercase variables (convention)
    - Case-preserved package name (rule)
  - Use targets
  - Use targets
  - Use targets
  - Always quote path variables