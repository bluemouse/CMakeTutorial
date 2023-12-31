cmake_minimum_required(VERSION 3.25)

project(Pokemons
  VERSION 1.0.0
  DESCRIPTION "Pocket monsters"
)

option(BUILD_PALETTE  "Build application Palette" ON)

option(ENABLE_KALOS_REGION  "Enable pokemons in Gen VI" OFF)

include(CMakeDependentOption)
cmake_dependent_option(ENABLE_MEGA_EVOLUTION "Enable mega evolution in Gen VI" ON "ENABLE_KALOS_REGION" OFF)

set(SRC_FILES
  src/Pokemon.cpp
  src/Pikachu.cpp
  src/Meowth.cpp
)

set(HEADER_FILES
  include/Pokemon.h
  include/Pikachu.h
  include/Meowth.h
)

if(ENABLE_KALOS_REGION)
  list(APPEND SRC_FILES src/Greninja.cpp)
  list(APPEND HEADER_FILES include/Greninja.h)
endif()

add_library(objlib OBJECT
  ${HEADER_FILES}
  ${SRC_FILES}
)
# @PRIVATE
target_include_directories(objlib
  PRIVATE
    include
)

set_target_properties(objlib
  PROPERTIES
    POSITION_INDEPENDENT_CODE ON
)

if (ENABLE_MEGA_EVOLUTION)
  target_compile_definitions(objlib PRIVATE ENABLE_MEGA)
endif()


add_library(${PROJECT_NAME}_shared SHARED $<TARGET_OBJECTS:objlib>)
set_target_properties(${PROJECT_NAME}_shared PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
# @INTERFACE
target_include_directories(${PROJECT_NAME}_shared
  INTERFACE
    include
)
# if (ENABLE_MEGA_EVOLUTION)
#   target_compile_definitions(${PROJECT_NAME}_shared
#     INTERFACE
#       ENABLE_MEGA
#   )
# endif()

add_library(${PROJECT_NAME}_static STATIC $<TARGET_OBJECTS:objlib>)
set_target_properties(${PROJECT_NAME}_static PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
# @INTERFACE
target_include_directories(${PROJECT_NAME}_static
  INTERFACE
    include
)
# if (ENABLE_MEGA_EVOLUTION)
#   target_compile_definitions(${PROJECT_NAME}_static
#     INTERFACE
#       ENABLE_MEGA
#   )
# endif()

# @alias library
add_library(Pokemons::Pokemons ALIAS ${PROJECT_NAME}_static)

#  @subdirectory
if(BUILD_PALETTE)
  add_subdirectory(applications/Pallet)
endif()