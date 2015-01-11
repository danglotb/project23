project(Cliff)

cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(Dependence)

#########################################
#			Configuration               #
#########################################

set(BUILD_TYPE "Debug" CACHE TYPE STRING)

#########################################

include(BuildType)

message(STATUS "Build type : ${BUILD_TYPE}")

add_definitions(-std=c++11)

#########################################
#		  Layer 1 : low_level           #
#########################################

set(low_level_project_name "Low_Level")
set(low_level_directory "low_level")

#########################################

message(STATUS "### Builing ${low_level_project_name} ###")

include(TypeSize)

add_subdirectory(layers/${low_level_directory})

get_directory_property(includes_low_level DIRECTORY layers/${low_level_directory} DEFINITION includes)

add_includes(${low_level_directory} ${includes_low_level})

#########################################
#	Layer 2 : platform_independence     #
#########################################

set(platform_independence_project_name "Platform_independence")
set(platform_independence_directory "platform_independence")

#########################################

message(STATUS "### Builing ${platform_independence_project_name} ###")

add_subdirectory(layers/${platform_independence_directory})

get_directory_property(includes_platform_independence DIRECTORY layers/${platform_independence_directory} DEFINITION includes)

add_includes(${platform_independence_directory} ${includes_platform_independence})

add_executable(${platform_independence_project_name}_tests layers/${platform_independence_directory}/tests/main.cpp)
target_link_libraries(${platform_independence_project_name}_tests ${low_level_project_name} ${platform_independence_project_name})
