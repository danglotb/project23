#ifndef _CLIFF_LOW_LEVEl_ASSERT_H
#define _CLIFF_LOW_LEVEl_ASSERT_H

#include "cliff/low_level/Header.h"

#include "cliff/program_control/BuildType.h"
#include "cliff/program_control/Exception.h"

#if CLIFF_BUILD_TYPE == CLIFF_BUILD_DEBUG
#	define CLIFF_ASSERT(CONDITION) if(!CONDITION) CLIFF_THROW(#CONDITION)
#else
#	define CLIFF_ASSERT(CONDITION)
#endif


#endif
