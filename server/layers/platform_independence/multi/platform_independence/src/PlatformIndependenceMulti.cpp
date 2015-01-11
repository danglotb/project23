#include "cliff/platform_independence/PlatformIndependenceMulti.h"

using namespace CLIFF;

void CLIFF::platformIndependenceInitialize() {
	platformIndependenceSpecificInitialize();
}

void CLIFF::platformIndependenceDestroy() {
	platformIndependenceSpecificDestroy();
}
