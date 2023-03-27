cmake_minimum_required(VERSION 3.25)

include(cmake/prelude.cmake)

project(
    cmake-init
    VERSION 0.0.0
    DESCRIPTION "cmake-init generated project"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    cmake-init_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    cmake-init_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(cmake-init_lib PUBLIC cxx_std_17)

find_package(fmt REQUIRED)
target_link_libraries(cmake-init_lib PRIVATE fmt::fmt)

# ---- Declare executable ----

add_executable(cmake-init_exe source/main.cpp)
add_executable(cmake-init::exe ALIAS cmake-init_exe)

set_property(TARGET cmake-init_exe PROPERTY OUTPUT_NAME cmake-init)

target_compile_features(cmake-init_exe PRIVATE cxx_std_17)

target_link_libraries(cmake-init_exe PRIVATE cmake-init_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT cmake-init_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of cmake-init"
  )
endif()

include(cmake/dev-mode.cmake)
