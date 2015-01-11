#include "cliff/program_control/Context.h"

using namespace CLIFF;


void StackContext::save(StackContext::Frame& frame) {

	#if defined(CLIFF_COMPILER_MINGW) || defined(CLIFF_COMPILER_GCC) || defined(CLIFF_COMPILER_CLANG)
	#	if CLIFF_POINTER_SIZE == 8
			asm("movq %%rbp, %0;"
				"movq %%rsp, %1;"
				: "=r"(frame.bp), "=r"(frame.sp)
				:
				:);
	#	elif CLIFF_POINTER_SIZE == 4
			asm("movl %%ebp, %0;"
				"movl %%esp, %1;"
				: "=r"(frame.bp), "=r"(frame.sp)
				:
				:);
	#	else
	#		error Incompatible CLIFF_POINTER_SIZE
	#	endif
	#else
	#	error Undefined Compiler
	#endif

}

void StackContext::restore(const StackContext::Frame& frame) {
	#if defined(CLIFF_COMPILER_MINGW) || defined(CLIFF_COMPILER_GCC) || defined(CLIFF_COMPILER_CLANG)
	#	if CLIFF_POINTER_SIZE == 8
			asm("movq %0, %%rbp;"
				"movq %1, %%rsp;"
				:
				: "r"(frame.bp), "r"(frame.sp)
				:);
	#	elif CLIFF_POINTER_SIZE == 4
			asm("movl %0, %%ebp;"
				"movl %1, %%esp;"
				: "=r"(frame.bp), "=r"(frame.sp)
				:
				:);
	#	else
	#		error Incompatible CLIFF_POINTER_SIZE
	#	endif
	#else
	#	error Undefined Compiler
	#endif
}
