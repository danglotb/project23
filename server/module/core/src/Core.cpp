#include "core/Core.h"

using namespace GLOBAL_NS;
using namespace CORE_NS;

_Core::_Core() {
	std::cout << "Initialization of Core" << std::endl;
}

_Core::~_Core() {
	std::cout << "Destruction of Core" << std::endl;
}

void _Core::run() {
	std::cout << "Core Running" << std::endl;
}
