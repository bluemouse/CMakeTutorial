cmake_minimum_required(VERSION 3.25)

project(imgui VERSION 1.89.4)

set(IMGUI_SOURCE_DIR ../imgui)
set(IMGUI_BACKENDS_DIR ${IMGUI_SOURCE_DIR}/backends)


set(SRC_FILES
  ${IMGUI_SOURCE_DIR}/imgui.cpp
  ${IMGUI_SOURCE_DIR}/imgui_draw.cpp
  ${IMGUI_SOURCE_DIR}/imgui_widgets.cpp
  ${IMGUI_SOURCE_DIR}/imgui_demo.cpp
  ${IMGUI_SOURCE_DIR}/imgui_tables.cpp
  ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl2.cpp
  ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.cpp
)

set(HEADER_FILES
  ${IMGUI_SOURCE_DIR}/imgui.h
  ${IMGUI_SOURCE_DIR}/imconfig.h
  ${IMGUI_SOURCE_DIR}/imgui_internal.h
  ${IMGUI_SOURCE_DIR}/imstb_rectpack.h
  ${IMGUI_SOURCE_DIR}/imstb_textedit.h
  ${IMGUI_SOURCE_DIR}/imstb_truetype.h
  ${IMGUI_BACKENDS_DIR}/imgui_impl_sdl2.h
  ${IMGUI_BACKENDS_DIR}/imgui_impl_vulkan.h
)

file(GLOB FONTS_FILES ${IMGUI_SOURCE_DIR}/misc/fonts/*.ttf)

add_library(${PROJECT_NAME} STATIC
  ${HEADER_FILES}
  ${SRC_FILES}
  ${FONTS_FILES}
)

target_include_directories(${PROJECT_NAME}
# @PUBLIC
  PUBLIC
    ${IMGUI_SOURCE_DIR}
    ${IMGUI_BACKENDS_DIR}
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
