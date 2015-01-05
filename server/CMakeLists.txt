cmake_minimum_required(VERSION 2.8)

project(Project23_server)

# Define the executable name
set(server_executable "server")

# Define the module used 
set(server_module core utility collection output)

# Define Compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Werror -Wextra -Wshadow -Wstrict-aliasing -pedantic -g3")

# Define Debug Level
add_definitions(-DDEBUG_LEVEL_3)

# Define cmake directory
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

if(MINGW)
    add_definitions(-gstabs)
endif()

# Detect compiler
if(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
    add_definitions(-DCOMPILER_GCC)
    Message(STATUS "Compiler family : GNU/GCC")
else()
	Message(FATAL_ERROR "Unrecognized Compiler")
endif()

# Detect Platform
if(WIN32)
	add_definitions(-DPLATFORM_WIN32)
	set(platform_name "win32")
	Message(STATUS "Platform family : Win32")
elseif(UNIX)
        add_definitions(-DPLATFORM_UNIX)
        set(platform_name "unix")
        Message(STATUS "Platform family : Unix")
else()
	Message(FATAL_ERROR "Unrecognized Platform")
endif()

# Architecture
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
    Message(STATUS "Architecture family : AMD64")
    add_definitions(-DARCHITECTURE_AMD64)
else()
    Message(FATAL_ERROR "Unrecognized Architecture : ${CMAKE_SYSTEM_PROCESSOR}")
endif()

include(Module)

# Detecte pointer size
if(CMAKE_SIZEOF_VOID_P EQUAL 4)
    add_definitions(-DPOINTER_SIZE=4)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 8)
    add_definitions(-DPOINTER_SIZE=8)
else()
    Message(FATAL_ERROR "Uncompatible Architecture (pointer size)")
endif()

# Includes
include_directories(include)
include_module(${server_module})

# Build all module
foreach(module_name ${server_module})
	message(STATUS "Build module '${module_name}'")
	add_subdirectory(module/${module_name})
endforeach(module_name)

# Main includes
file(
	GLOB_RECURSE
	include_files
	
	include/*.h
)

# Main sources
file(
	GLOB_RECURSE
	source_files
	
	src/*.cpp
)

# Create executable
add_executable(${server_executable} ${include_files} ${source_files})

# Add module to executable
target_link_libraries (${server_executable} ${server_module})

#Compiler link dbg tool
if(MINGW)
    target_link_libraries (${server_executable} imagehlp)
endif()
