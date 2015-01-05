#ifndef _OUTPUT_REPORT_H
#define _OUTPUT_REPORT_H

#include "output/Header.h"

#include "output/AssignedOutputStream.h"

#include "collection/String.h"

namespace GLOBAL_NS {

	namespace OUTPUT_NS {

		class Report {

		public:
			static COLLECTION_NS::String printSystemConfiguration();

			static COLLECTION_NS::String printStackTrace();
		};
	}
}



#endif
