#include "cliff/console/Console.h"

using namespace CLIFF;

ConsoleTextColor ConsoleAttribute::_currentTextColor = CONSOLE_TEXT_COLOR_WHITE;
ConsoleBackgroundColor ConsoleAttribute::_currentBackgroundColor = CONSOLE_BACKGROUND_COLOR_BLACK;

static HANDLE console_out_handler;
static HANDLE console_err_handler;

void ConsoleAttribute::setTextColor(ConsoleTextColor color) {
	_currentTextColor = color;
	changeTextAttribute();
}

void ConsoleAttribute::setBackgroundColor(ConsoleBackgroundColor color) {
	_currentBackgroundColor = color;
	changeTextAttribute();
}

void ConsoleAttribute::changeTextAttribute() {
	DWORD text_color;

	switch(_currentTextColor) {
	case CONSOLE_TEXT_COLOR_RED:
		text_color = FOREGROUND_RED | FOREGROUND_INTENSITY;
		break;
	case CONSOLE_TEXT_COLOR_GREEN:
		text_color = FOREGROUND_GREEN | FOREGROUND_INTENSITY;
		break;
	case CONSOLE_TEXT_COLOR_BLUE:
		text_color = FOREGROUND_BLUE | FOREGROUND_INTENSITY;
		break;
	case CONSOLE_TEXT_COLOR_BLACK:
		text_color = 0;
		break;
	default:
		text_color = FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE | FOREGROUND_INTENSITY;
	}

	DWORD background_color;

	switch(_currentBackgroundColor) {
	case CONSOLE_BACKGROUND_COLOR_RED:
		background_color = BACKGROUND_RED;
		break;
	case CONSOLE_BACKGROUND_COLOR_GREEN:
		background_color = BACKGROUND_GREEN;
		break;
	case CONSOLE_BACKGROUND_COLOR_BLUE:
		background_color = BACKGROUND_BLUE;
		break;
	case CONSOLE_BACKGROUND_COLOR_WHITE:
		background_color = BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_BLUE;
		break;
	default:
		background_color = 0;


	}

	SetConsoleTextAttribute(console_out_handler, text_color | background_color);
}

void cliff_private::ConsoleManager::initialize() {
	console_out_handler = GetStdHandle(STD_OUTPUT_HANDLE);

	if(console_out_handler ==  INVALID_HANDLE_VALUE || console_out_handler ==  NULL) {
		//CLIFF_THROW(); //TODO throw message
	}

	console_err_handler = GetStdHandle(STD_ERROR_HANDLE);

	if(console_err_handler == INVALID_HANDLE_VALUE || console_err_handler == NULL) {
		//CLIFF_THROW(); //TODO throw message
	}

	ConsoleAttribute::changeTextAttribute();
}

void Console<Ascii>::writeToStandart(const charAscii* buffer, uint32 length) {
	DWORD nb_write;
	bool writeSuccess;

	writeSuccess = WriteConsoleA(console_out_handler, buffer, length, &nb_write, NULL);

	if(!writeSuccess) { //Try simple write to output
		WriteFile(console_out_handler, buffer, length, &nb_write, NULL);
	}
}

void Console<Utf8>::writeToStandart(const charUtf8* buffer, uint32 length) {
	DWORD nb_write;
	bool writeSuccess;
#define _WIDE_BUFFER_SIZE 512
	WCHAR wide_buffer[_WIDE_BUFFER_SIZE];

	if((nb_write = MultiByteToWideChar(CP_UTF8, 0, buffer, length, wide_buffer, _WIDE_BUFFER_SIZE)) == 0) {
		//CLIFF_THROW(); //TODO throw message
		return;
	}

	writeSuccess = WriteConsoleW(console_out_handler, wide_buffer, nb_write, &nb_write, NULL);

	if(!writeSuccess) { //Try simple write to output
		WriteFile(console_out_handler, buffer, length, &nb_write, NULL);
	}
}
