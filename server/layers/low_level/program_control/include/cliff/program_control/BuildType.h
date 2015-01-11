#ifndef _CLIFF_LOW_LEVEL_BUILD_TYPE_H
#define _CLIFF_LOW_LEVEL_BUILD_TYPE_H

#include "cliff/low_level/Header.h"

#ifndef CLIFF_BUILD_TYPE
#	error Missing CLIFF_BUILD_TYPE
#endif

#define CLIFF_BUILD_DEBUG		0
#define CLIFF_BUILD_DEBUG_OPTI	1
#define CLIFF_BUILD_RELEASE		2

#if CLIFF_BUILD_TYPE != 0 && CLIFF_BUILD_TYPE != 1 && CLIFF_BUILD_TYPE != 3
#	error Incorrect Build Type : \
	CLIFF_BUILD_DEBUG		0, \
	CLIFF_BUILD_DEBUG_OPTI	1, \
	CLIFF_BUILD_RELEASE		2
#endif

#endif
