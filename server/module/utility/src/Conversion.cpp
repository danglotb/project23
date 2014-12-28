#include "utility/Conversion.h"

using namespace GLOBAL_NS;
using namespace UTILITY_NS;

std::string Conversion::intToString(int i) {
	std::stringstream s;
	s << i;
	return s.str();
}

