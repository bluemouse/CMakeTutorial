cmake_minimum_required(VERSION 3.25)

project(imgui VERSION 1.89.4)

# @external source tree
set(imgui_SOURCE_DIR ../imgui)
set(imgui_BACKENDS_DIR ${imgui_SOURCE_DIR}/backends)


set(SRC_FILES
  ${imgui_SOURCE_DIR}/imgui.cpp
  ${imgui_SOURCE_DIR}/imgui_draw.cpp
  ${imgui_SOURCE_DIR}/imgui_widgets.cpp
  ${imgui_SOURCE_DIR}/imgui_demo.cpp
  ${imgui_SOURCE_DIR}/imgui_tables.cpp
  ${imgui_BACKENDS_DIR}/imgui_impl_sdl2.cpp
  ${imgui_BACKENDS_DIR}/imgui_impl_vulkan.cpp
)

set(HEADER_FILES
  ${imgui_SOURCE_DIR}/imgui.h
  ${imgui_SOURCE_DIR}/imconfig.h
  ${imgui_SOURCE_DIR}/imgui_internal.h
  ${imgui_SOURCE_DIR}/imstb_rectpack.h
  ${imgui_SOURCE_DIR}/imstb_textedit.h
  ${imgui_SOURCE_DIR}/imstb_truetype.h
  ${imgui_BACKENDS_DIR}/imgui_impl_sdl2.h
  ${imgui_BACKENDS_DIR}/imgui_impl_vulkan.h
)

file(GLOB FONTS_FILES ${imgui_SOURCE_DIR}/misc/fonts/*.ttf)

add_library(${PROJECT_NAME} STATIC
  ${HEADER_FILES}
  ${SRC_FILES}
  ${FONTS_FILES}
)

target_include_directories(${PROJECT_NAME}
# @PUBLIC
  PUBLIC
    ${imgui_SOURCE_DIR}
    ${imgui_BACKENDS_DIR}
)

# @dependencies
find_package(SDL2 REQUIRED)
find_package(Vulkan REQUIRED)
target_link_libraries(${PROJECT_NAME}
# @PUBLIC
  PUBLIC
    SDL2::SDL2
    Vulkan::Vulkan
)
