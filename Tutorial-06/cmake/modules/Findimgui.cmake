if(TARGET imgui::imgui)
  return()
endif()

cmake_path(GET CMAKE_SOURCE_DIR PARENT_PATH CMakeTutorial_ROOT)
set(EXTERNALS_ROOT "${CMakeTutorial_ROOT}/externals")


# @library target
add_library(imgui::imgui UNKNOWN IMPORTED)

# @inlcudes
find_path(imgui_INCLUDE_DIR
          imgui.h
          PATHS "${EXTERNALS_ROOT}/imgui"
          REQUIRED
)
set(imgui_INCLUDE_DIRS "${imgui_INCLUDE_DIR}" "${imgui_INCLUDE_DIR}/backends")

# @libraries
find_library(imgui_LIBRARY
             imgui
             PATHS "${EXTERNALS_ROOT}/imgui-cmake/Build"
             REQUIRED
)
set_target_properties(imgui::imgui PROPERTIES
  IMPORTED_LOCATION "${imgui_LIBRARY}"
)
set(imgui_LIBRARIES ${imgui_LIBRARY})

# @transitive include dirs
set_target_properties(imgui::imgui PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${imgui_INCLUDE_DIRS}"
)
# @transitive link dependencies
find_package(SDL2 REQUIRED)
find_package(Vulkan REQUIRED)
set_target_properties(imgui::imgui PROPERTIES
  INTERFACE_LINK_LIBRARIES "Vulkan::Vulkan;SDL2::SDL2"
)

# handle the QUIETLY and REQUIRED arguments and set tinyobjloader_FOUND to TRUE
# if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(imgui
                                  DEFAULT_MSG
                                  imgui_INCLUDE_DIRS
                                  imgui_LIBRARIES
)

mark_as_advanced(
  imgui_INCLUDE_DIRS
  imgui_INCLUDE_DIR
  imgui_LIBRARIES
  imgui_LIBRARY
)
