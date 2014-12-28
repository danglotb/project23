#ifndef _CORE_CORE_H
#define _CORE_CORE_H

#include <iostream>

#include "core/Header.h"

#include "utility/Singleton.h"
#include "utility/SingletonManager.h"

#include "collection/Buffer.h"

namespace GLOBAL_NS {

	namespace CORE_NS {

		class _Core {

		public:
			_Core();
			~_Core();
			void run();
		};

		typedef Singleton<_Core, SingletonDefaultManager> Core;

	}

}

#endif
