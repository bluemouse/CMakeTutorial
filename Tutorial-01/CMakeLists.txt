cmake_minimum_required(VERSION 3.25)

project(Pikachu VERSION 1.0.0)

# message(STATUS PROJECT_NAME="${PROJECT_NAME}")

# include(CMakePrintHelpers)
# cmake_print_variables(PROJECT_NAME)
# cmake_print_variables(PROJECT_SOURCE_DIR)
# cmake_print_variables(PikaPika_SOURCE_DIR)


set(SRC_FILES
  src/main.cpp
  src/Pikachu.cpp
)
# cmake_print_variables(SRC_FILES)

set(HEADER_FILES
  src/Pikachu.h
)

add_executable(${PROJECT_NAME}
  ${HEADER_FILES}
  ${SRC_FILES}
)