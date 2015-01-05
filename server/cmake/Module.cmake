function(build_module module_name)

set(module_dependence utility collection output)

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

file(
	GLOB_RECURSE
	
	include_third_part_files
	
	third_part/${platform_name}/include/*.h
)

file(
	GLOB_RECURSE
	
	source_third_part_files
	
	third_part/${platform_name}/src/*.cpp
)

add_library (${module_name} STATIC ${include_files} ${source_files} ${include_third_part_files} ${source_third_part_files})

endfunction(build_module)

function(include_module module_list)
foreach(module_name ${ARGV})
	include_directories(
		module/${module_name}/include
		module/${module_name}/third_part/${platform_name}/include
	)
endforeach(module_name)

endfunction(include_module)