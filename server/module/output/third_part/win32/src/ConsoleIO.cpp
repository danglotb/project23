#include "output/ConsoleIO.h"

#include <Windows.h>

#include <iostream>

using namespace GLOBAL_NS;
using namespace OUTPUT_NS;

static HANDLE console_out_handler;
static HANDLE console_err_handler;

static void writeTo(HANDLE handle, const void* data, unsigned int size) {
	unsigned int cursor = 0;
	DWORD n_write;

	do {
		if(WriteFile(handle, (uint8_t*)data+cursor, size-cursor, &n_write, NULL) != TRUE) {
			//TODO centralized exit function
			exit(1);
		}
		cursor += n_write;
	}
	while(cursor < size);
}

ConsoleIO::ConsoleIO() {

}

void ConsoleIO::initialize() {

	console_out_handler = GetStdHandle(STD_OUTPUT_HANDLE);

	if(console_out_handler == NULL || console_out_handler == INVALID_HANDLE_VALUE) {
		//TODO centralized exit function
		exit(1);
	}

	console_err_handler = GetStdHandle(STD_ERROR_HANDLE);

	if(console_err_handler == NULL || console_err_handler == INVALID_HANDLE_VALUE) {
		//TODO centralized exit function
		exit(1);
	}
}

void ConsoleIO::destroy() {
	CloseHandle(console_out_handler);
	CloseHandle(console_err_handler);
}

void ConsoleIO::writeToStandartOutput(const void* data, unsigned int size) {
	writeTo(console_out_handler, data, size);
}

void ConsoleIO::writeToStandartError(const void* data, unsigned int size) {
	writeTo(console_err_handler, data, size);
}
