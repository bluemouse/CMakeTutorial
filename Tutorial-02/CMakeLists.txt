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

add_library(${PROJECT_NAME}
  ${HEADER_FILES}
  ${SRC_FILES}
)

# @STATIC/SHARED
# add_library(${PROJECT_NAME} SHARED
#   ${HEADER_FILES}
#   ${SRC_FILES}
# )

target_include_directories(${PROJECT_NAME}
  PRIVATE
    include
)


#  @targets
# add_library(${PROJECT_NAME}_shared SHARED EXCLUDE_FROM_ALL
#   ${HEADER_FILES}
#   ${SRC_FILES}
# )

# target_include_directories(${PROJECT_NAME}_shared
#   PRIVATE
#     include
# )
