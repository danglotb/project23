#include "cliff/program_control/Entry.h"

using namespace CLIFF;

StackContext::Frame _cliff_mainFrame;
int _cliff_returnValue = 0;
bool _cliff_doExit = false;

#define SECURE_EXECUTE(...) if(!_cliff_doExit) { __VA_ARGS__ }


int main() {

	StackContext::save(_cliff_mainFrame);

	SECURE_EXECUTE(platformIndependenceInitialize();)

	SECURE_EXECUTE(cliffEntry();)

	SECURE_EXECUTE(platformIndependenceDestroy();)

	return _cliff_returnValue;
}
