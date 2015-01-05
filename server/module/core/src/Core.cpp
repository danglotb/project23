#include "core/Core.h"

using namespace GLOBAL_NS;
using namespace CORE_NS;

_Core::_Core() {
	OUTPUT_NS::lerr << "Initialization of Core";
}

_Core::~_Core() {
	std::cout << "Destruction of Core" << std::endl;

	/*int* p = nullptr;
	*p = 23;*/
}

void _Core::run() {
	std::cout << "Core Running" << std::endl;
}
