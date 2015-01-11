project(${low_level_project_name})

cmake_minimum_required(VERSION 2.8) 

# Compiler
if(MINGW)
    add_definitions(-DCLIFF_COMPILER_MINGW)
elseif(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCC )
    add_definitions(-DCLIFF_COMPILER_GCC)
else()
    Message(FATAL_ERROR "Unknown compiler")
endif()

set(includes
	low_level/include

	type/include
	program_control/include
	asm/include
)

include_directories(${includes})

file(
	GLOB_RECURSE
	
	include_files

	low_level/include/cliff/low_level/Header.h
	
	type/include/cliff/type/Character.h
	type/include/cliff/type/PrimitiveType.h
	type/include/cliff/type/StringFunction.h
	type/include/cliff/type/TypeToType.h
	
	program_control/include/cliff/program_control/Assert.h
	program_control/include/cliff/program_control/BuildType.h
	program_control/include/cliff/program_control/Exception.h
	program_control/include/cliff/program_control/Exit.h
	program_control/include/cliff/program_control/Entry.h
	program_control/include/cliff/program_control/Context.h

	asm/include/cliff/asm/Asm.h
)

file(
	GLOB_RECURSE
	
	source_files
	
	type/src/Character.cpp
	type/src/PrimitiveType.cpp
	type/src/StringFunction.cpp

	program_control/src/Exit.cpp
	program_control/src/Entry.cpp
	program_control/src/Context.cpp
)

add_library(${PROJECT_NAME} STATIC ${include_files} ${source_files})
