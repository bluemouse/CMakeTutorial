cmake_minimum_required(VERSION 3.25)

project(Pallet
  VERSION 1.0.0
  DESCRIPTION "The hometown of Ash Ketchum."
  HOMEPAGE_URL "https://bulbapedia.bulbagarden.net/wiki/Pallet_Town"
)

set(SRC_FILES
  src/main.cpp
)

set(HEADER_FILES
)

add_executable(${PROJECT_NAME}
  ${HEADER_FILES}
  ${SRC_FILES}
)

# @target_link_libraries
target_link_libraries(${PROJECT_NAME}
PRIVATE
  Pokemons::Pokemons
)
