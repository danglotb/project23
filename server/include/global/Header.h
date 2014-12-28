#ifndef _GLOBAL_HEADER_H
#define _GLOBAL_HEADER_H

#define GLOBAL_NS p23

//Compiler
#ifdef COMPILER_GCC
	#include "global/compiler/gcc.h"
#else
	#error Unsupported Compiler
#endif

/*
 * Debug Level :
 * 0 = Realese mode
 * 1 = Debug Info with optimization
 * 2 = Light Debug
 * 3 = Full Debug
 */

#ifdef DEBUG_LEVEL_0
	#define IF_DEBUG_1(EXPR)
	#define IF_DEBUG_2(EXPR)
	#define IF_DEBUG_3(EXPR)
#elif DEBUG_LEVEL_1
	#define IF_DEBUG_1(EXPR) EXPR
	#define IF_DEBUG_2(EXPR)
	#define IF_DEBUG_3(EXPR)
#elif DEBUG_LEVEL_2
	#define IF_DEBUG_1(EXPR) EXPR
	#define IF_DEBUG_2(EXPR) EXPR
	#define IF_DEBUG_3(EXPR)
#elif DEBUG_LEVEL_3
	#define IF_DEBUG_1(EXPR) EXPR
	#define IF_DEBUG_2(EXPR) EXPR
	#define IF_DEBUG_3(EXPR) EXPR
#else
	#error No debug level define (Please define DEBUG_LEVEL_X with X between 0 and 3)
#endif

#endif
