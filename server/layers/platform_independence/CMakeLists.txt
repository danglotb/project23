project(${platform_independence_project_name})

cmake_minimum_required(VERSION 2.8)

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

set(includes
	multi/platform_independence/include
	
	multi/console/include

	${platform_name}/console/include
	${platform_name}/platform_independence/include
)

include_directories(${includes})

file(
	GLOB_RECURSE
	multi_include_files


	multi/platform_independence/include/cliff/platform_independence/Header.h
	multi/platform_independence/include/cliff/platform_independence/PlatformIndependenceMulti.h
	
	multi/console/include/cliff/console/ConsoleHeader.h
)

file(
	GLOB_RECURSE
	platform_include_files
	
	${platform_name}/console/include/cliff/console/Console.h
	${platform_name}/platform_independence/include/cliff/platform_independence/PlatformIndependenceSpecific.h
)

file(
	GLOB_RECURSE

	multi_source_files
	
	multi/platform_independence/src/PlatformIndependenceMulti.cpp
)

file(
	GLOB_RECURSE
	
	platform_source_files
	
	${platform_name}/console/src/Console.cpp
	${platform_name}/platform_independence/src/PlatformIndependenceSpecific.cpp

)

add_library(${PROJECT_NAME} STATIC ${platform_include_files} ${multi_include_files} ${platform_source_files} ${multi_source_files})
