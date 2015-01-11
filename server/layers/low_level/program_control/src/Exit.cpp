#include "cliff/program_control/Exit.h"

using namespace CLIFF;

extern StackContext::Frame _cliff_mainFrame;
extern int _cliff_returnValue;
extern bool _cliff_doExit;

void Exit::failure() {
	_cliff_returnValue = 0xFF;
	_cliff_doExit = true;
	StackContext::restore(_cliff_mainFrame);
}

void Exit::success() {
	_cliff_returnValue = 0x0;
	_cliff_doExit = true;
	StackContext::restore(_cliff_mainFrame);
}
