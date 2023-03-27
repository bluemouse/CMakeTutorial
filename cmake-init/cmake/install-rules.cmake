install(
    TARGETS cmake-init_exe
    RUNTIME COMPONENT cmake-init_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
