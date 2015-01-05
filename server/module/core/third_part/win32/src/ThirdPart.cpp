#include "core/ThirdPart.h"

#include <windows.h>
#include "output/ReportWin32.h"

using namespace GLOBAL_NS;
using namespace CORE_NS;

void ThirdPart::initialize() {
	SetUnhandledExceptionFilter(OUTPUT_NS::ReportWin32::ExceptionHandler);
}

void ThirdPart::destroy() {

}
