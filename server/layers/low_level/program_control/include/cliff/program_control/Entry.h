#ifndef _CLIFF_LOW_LEVEL_ENTRY_H
#define _CLIFF_LOW_LEVEL_ENTRY_H

#include "cliff/low_level/Header.h"

#include "cliff/program_control/Context.h"
#include "cliff/program_control/Exit.h"

///
/// \brief cliffEntry : The user entry function
///
extern void cliffEntry();


namespace CLIFF {

	///initialize & destroy layers function

	extern void platformIndependenceInitialize();
	extern void platformIndependenceDestroy();

}
#endif
