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

# Detect compiler
if(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
    add_definitions(-DCOMPILER_GCC)
    Message(STATUS "Compiler family : GNU/GCC")
endif()

include_directories(include)

# Build all module
foreach(module_name ${server_module})
	message(STATUS "Build module '${module_name}'")
	add_subdirectory(module/${module_name})
	include_directories(module/${module_name}/include)
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
