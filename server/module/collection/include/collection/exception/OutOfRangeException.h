#ifndef _COLLECTION_OUT_OF_RANGE_EXCEPTION_H
#define _COLLECTION_OUT_OF_RANGE_EXCEPTION_H

#include <stdexcept>

#include "collection/Header.h"

#include "utility/Conversion.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		class OutOfRangeException : public std::runtime_error {

		public:
			OutOfRangeException(int index, int max_range) : std::runtime_error(
																"Out Of Range : try to access to the element "+
																UTILITY_NS::Conversion::intToString(index)+
																" with a max range of "+
																UTILITY_NS::Conversion::intToString(max_range)
																) {

			}

		};
	}
}

#endif
