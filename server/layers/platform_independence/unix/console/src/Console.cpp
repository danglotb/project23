#include "cliff/console/Console.h"

#include <stdio.h>
#include <stdlib.h>

using namespace CLIFF;

void ConsoleAttribute::setTextColor(ConsoleTextColor color) {
	switch(color) {

	case CONSOLE_TEXT_COLOR_RED:
		printf("\x1b[31m");
		break;
	case CONSOLE_TEXT_COLOR_GREEN:
		printf("\x1b[32m");
		break;
	case CONSOLE_TEXT_COLOR_BLUE:
		printf("\x1b[34m");
		break;
	case CONSOLE_TEXT_COLOR_WHITE:
		printf("\x1b[37m");
		break;
	case CONSOLE_TEXT_COLOR_BLACK:
		printf("\x1b[30m");
		break;
	default:
		printf("\x1b[39m");

	}
}

void ConsoleAttribute::setBackgroundColor(ConsoleBackgroundColor color) {
	switch(color) {

	case CONSOLE_BACKGROUND_COLOR_RED:
		printf("\x1b[41m");
		break;
	case CONSOLE_BACKGROUND_COLOR_GREEN:
		printf("\x1b[42m");
		break;
	case CONSOLE_BACKGROUND_COLOR_BLUE:
		printf("\x1b[44m");
		break;
	case CONSOLE_BACKGROUND_COLOR_WHITE:
		printf("\x1b[47m");
		break;
	case CONSOLE_BACKGROUND_COLOR_BLACK:
		printf("\x1b[40m");
		break;
	default:
		printf("\x1b[49m");

	}
}

void Console<Ascii>::writeToStandart(const charAscii* buffer, uint32 length) {
	printf("%s", buffer);
}


void Console<Utf8>::writeToStandart(const charUtf8* buffer, uint32 length) {
#define MAX_WCHAR_BUFFER 512
	wchar_t wbuffer[MAX_WCHAR_BUFFER];
	mbstowcs(wbuffer, buffer, MAX_WCHAR_BUFFER);
	printf("%ls", wbuffer);
}
