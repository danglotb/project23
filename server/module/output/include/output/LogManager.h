#ifndef _OUTPUT_LOG_H
#define _OUTPUT_LOG_H

#include "output/Header.h"
#include "output/LogOutput.h"
#include "output/AssignedOutputStream.h"
#include "output/ConsoleIO.h"

#include "utility/Singleton.h"
#include "utility/SingletonManager.h"

namespace GLOBAL_NS {

	namespace OUTPUT_NS {

		class _LogManager {

		public:
			void initialize();
			void destroy();

		};

		typedef UTILITY_NS::Singleton<_LogManager, UTILITY_NS::SingletonWithoutManager> LogManager;



		extern AssignedOutputStream<LogStd> lstd;
		extern AssignedOutputStream<LogError> lerr;


	}
}

#endif
