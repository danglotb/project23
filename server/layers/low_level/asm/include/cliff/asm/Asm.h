#ifndef _CLIFF_LOW_LEVEL_ASM_H
#define _CLIFF_LOW_LEVEL_ASM_H

#if defined(CLIFF_COMPILER_MINGW) || defined(CLIFF_COMPILER_GCC) || defined(CLIFF_COMPILER_CLANG)
#define	CLIFF_ASM_INPUT(COMMAND, VAR) asm("COMMAND" : :  )
#define	CLIFF_ASM_OUTPUT(COMMAND, VAR)
#else
#	error Undefined Compiler
#endif

#endif
