#include "output/LogManager.h"

using namespace GLOBAL_NS;
using namespace OUTPUT_NS;

AssignedOutputStream<LogStd> GLOBAL_NS::OUTPUT_NS::lstd;
AssignedOutputStream<LogError> GLOBAL_NS::OUTPUT_NS::lerr;

void _LogManager::initialize() {
	ConsoleIO::initialize();
}

void _LogManager::destroy() {
	ConsoleIO::destroy();
}
