cmake_minimum_required(VERSION 3.25)

project(Pokemons
  VERSION 1.0.0
  DESCRIPTION "Pocket monsters"
)
# @options
option(ENABLE_KALOS_REGION  "Enable pokemons in Gen VI" OFF)
# @dependent options
include(CMakeDependentOption)
cmake_dependent_option(ENABLE_MEGA_EVOLUTION "Enable mega evolution in Gen VI" ON "ENABLE_KALOS_REGION" OFF)

set(SRC_FILES
  "src/Pokemon src/Pikachu.cpp"
  src/Meowth.cpp
)

# @list
include(CMakePrintHelpers)
cmake_print_variables(SRC_FILES)

set(HEADER_FILES
  include/Pokemon.h
  include/Pikachu.h
  include/Meowth.h
)

if(ENABLE_KALOS_REGION)
  list(APPEND SRC_FILES src/Greninja.cpp)
  list(APPEND HEADER_FILES include/Greninja.h)
  # cmake_print_variables(SRC_FILES)
endif()

# @object library
add_library(objlib OBJECT
  ${HEADER_FILES}
  ${SRC_FILES}
)
target_include_directories(objlib
  PRIVATE
    include
)

#  @POSITION_INDEPENDENT_CODE
set_target_properties(objlib
  PROPERTIES
    POSITION_INDEPENDENT_CODE ON # -fPIC
)
# set(CMAKE_POSITION_INDEPENDENT_CODE ON)

if (ENABLE_MEGA_EVOLUTION)
# @target_compile_definitions
  target_compile_definitions(objlib PRIVATE ENABLE_MEGA)
endif()


add_library(${PROJECT_NAME}_shared SHARED $<TARGET_OBJECTS:objlib>)
set_target_properties(${PROJECT_NAME}_shared PROPERTIES OUTPUT_NAME ${PROJECT_NAME})

add_library(${PROJECT_NAME}_static STATIC $<TARGET_OBJECTS:objlib>)
set_target_properties(${PROJECT_NAME}_static PROPERTIES OUTPUT_NAME ${PROJECT_NAME})

