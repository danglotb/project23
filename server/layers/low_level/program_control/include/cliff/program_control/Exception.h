#ifndef _CLIFF_LOW_LEVEL_EXCEPTION_H
#define _CLIFF_LOW_LEVEL_EXCEPTION_H

#include "cliff/low_level/Header.h"

#include "cliff/program_control/Exit.h"

#define CLIFF_THROW(EXCEPTION) { \
			CLIFF::Exit::failure(); \
		}

#endif
