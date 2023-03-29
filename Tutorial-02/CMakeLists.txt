cmake_minimum_required(VERSION 3.25)

project(Pokemons
  VERSION 1.0.0
  DESCRIPTION "Pocket monsters"
)

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

# @STATIC/SHARED
add_library(${PROJECT_NAME} STATIC
  ${HEADER_FILES}
  ${SRC_FILES}
)

target_include_directories(${PROJECT_NAME}
  PRIVATE
    include
)

# @dependencies
# find_package(Vulkan REQUIRED)
# target_link_libraries(${PROJECT_NAME}
#   PRIVATE
#     Vulkan::Vulkan
# )

# @targets: SHARED
# add_library(${PROJECT_NAME}_shared SHARED EXCLUDE_FROM_ALL
#   ${HEADER_FILES}
#   ${SRC_FILES}
# )
# set_target_properties(${PROJECT_NAME}_shared PROPERTIES OUTPUT_NAME ${PROJECT_NAME})

# target_include_directories(${PROJECT_NAME}_shared
#   PRIVATE
#     include
# )

