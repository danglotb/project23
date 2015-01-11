#ifndef _CLIFF_PLATFORM_INDEPENDENCE_MULTI_H
#define _CLIFF_PLATFORM_INDEPENDENCE_MULTI_H

#include "cliff/platform_independence/Header.h"

#include "cliff/platform_independence/PlatformIndependenceSpecific.h"

namespace CLIFF {

	///
	/// \brief platformIndependenceInitialize : function call before user entry
	///
	void platformIndependenceInitialize();

	///
	/// \brief platformIndependenceInitialize : function call after user entry
	///
	void platformIndependenceDestroy();

}


#endif
