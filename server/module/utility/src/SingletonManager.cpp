#include "utility/SingletonManager.h"

using namespace GLOBAL_NS;
using namespace UTILITY_NS;

std::stack<void(*)()> SingletonManagerHandler::_destroyHandlers;
