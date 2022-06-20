# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
	message(STATUS "Setting build type to 'Release' as none was specified.")
  set(CMAKE_BUILD_TYPE
	  Release
      CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui, ccmake
  set_property(
    CACHE CMAKE_BUILD_TYPE
    PROPERTY STRINGS
             "Debug"
             "Release"
             "MinSizeRel"
             "RelWithDebInfo")
endif()

# Generate compile_commands.json to make it easier to work with clang based tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(BAN_RTTI "-fno-rtti" ON)
if(BAN_RTTI)
  add_compile_options(-fno-rtti)
endif()

option(BAN_EXCEPTIONS "-fno-exceptions" ON)
if(BAN_EXCEPTIONS)
  add_compile_options(-fno-exceptions)
endif()

option(ENABLE_PROFILING "-pg" OFF)
if(BAN_EXCEPTIONS)
  add_compile_options(-pg)
  add_link_options(-pg)
endif()

option(ENABLE_IPO "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)" ON)
if(ENABLE_IPO)
  include(CheckIPOSupported)
  check_ipo_supported(
    RESULT
    result
    OUTPUT
    output)
  if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)
  else()
    message(SEND_ERROR "IPO is not supported: ${output}")
  endif()
endif()
if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
  add_compile_options(-fcolor-diagnostics)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  add_compile_options(-fdiagnostics-color=always)
else()
  message(STATUS "No colored compiler diagnostic set for '${CMAKE_CXX_COMPILER_ID}' compiler.")
endif()

