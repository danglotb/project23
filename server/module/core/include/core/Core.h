#ifndef _CORE_CORE_H
#define _CORE_CORE_H

#include "core/Header.h"

#include "utility/Singleton.h"
#include "utility/SingletonManager.h"

#include "collection/Buffer.h"

#include "output/LogManager.h"

namespace GLOBAL_NS {

	namespace CORE_NS {

		class _Core {

		public:
			_Core();
			~_Core();
			void run();
		};

		typedef UTILITY_NS::Singleton<_Core, UTILITY_NS::SingletonDefaultManager> Core;

	}

}

#endif
