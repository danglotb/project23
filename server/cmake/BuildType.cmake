# Build Type

if(${BUILD_TYPE} STREQUAL "Debug")
    add_definitions(-DCLIFF_BUILD_TYPE=${BUILD_TYPE})
elseif(${BUILD_TYPE} STREQUAL "DebugOpti")
    add_definitions(-DCLIFF_BUILD_TYPE=${BUILD_TYPE})
elseif(${BUILD_TYPE} STREQUAL "Release")
    add_definitions(-DCLIFF_BUILD_TYPE=${BUILD_TYPE})
else()
    message(FATAL_ERROR "Incorrect build type : Debug | DebugOpti | Release")
endif()