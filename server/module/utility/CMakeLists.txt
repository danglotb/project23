
# Utility Module
set(module_name "utility")

set(module_dependence "")

# Target internal dependence
foreach(dependence_name ${module_dependence})
	include_directories(../../module/${dependence_name}/include)
endforeach(dependence_name)

# Include current directories
include_directories(include)

file(
	GLOB_RECURSE
	
	include_files
	
	include/*.h
)

file(
	GLOB_RECURSE
	
	source_files
	
	src/*.cpp
)

add_library (${module_name} STATIC ${include_files} ${source_files})
