#include "cliff/platform_independence/PlatformIndependenceSpecific.h"

#include <locale.h>

using namespace CLIFF;

void CLIFF::platformIndependenceSpecificInitialize() {
    setlocale(LC_ALL, "");
}

void CLIFF::platformIndependenceSpecificDestroy() {

}
