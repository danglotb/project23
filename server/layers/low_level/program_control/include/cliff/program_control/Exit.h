#ifndef _CLIFF_LOW_LEVEL_EXIT_H
#define _CLIFF_LOW_LEVEL_EXIT_H

#include "cliff/low_level/Header.h"

#include "cliff/program_control/Context.h"

namespace CLIFF {

	class Exit {

	public:
		static void failure();
		static void success();

	};
}

#endif
