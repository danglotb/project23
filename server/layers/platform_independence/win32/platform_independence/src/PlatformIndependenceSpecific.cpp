#include "cliff/platform_independence/PlatformIndependenceSpecific.h"

using namespace CLIFF;

void CLIFF::platformIndependenceSpecificInitialize() {
	cliff_private::ConsoleManager::initialize();
}

void CLIFF::platformIndependenceSpecificDestroy() {

}
