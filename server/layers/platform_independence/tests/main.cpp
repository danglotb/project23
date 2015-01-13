#include "cliff/console/Console.h"
#include "cliff/type/PrimitiveType.h"

#include "cliff/program_control/Exit.h"
#include "cliff/type/StringFunction.h"


#include <iostream>
using namespace CLIFF;

void cliffEntry() {
	const charAscii* s1 = "[Test] Initialization\n";
	Console<Ascii>::writeToStandart(s1, StringFunction<Ascii>::getLength(s1));

	const charAscii* s2 = "[Test] Text Color :\n";
	const charAscii* sR = "Red\n";
	const charAscii* sG = "Green\n";
	const charAscii* sB = "Blue\n";

	Console<Ascii>::writeToStandart(s2, StringFunction<Ascii>::getLength(s2));

	ConsoleAttribute::setTextColor(CONSOLE_TEXT_COLOR_RED);
	Console<Ascii>::writeToStandart(sR, StringFunction<Ascii>::getLength(sR));

	ConsoleAttribute::setTextColor(CONSOLE_TEXT_COLOR_GREEN);
	Console<Ascii>::writeToStandart(sG, StringFunction<Ascii>::getLength(sG));

	ConsoleAttribute::setTextColor(CONSOLE_TEXT_COLOR_BLUE);
	Console<Ascii>::writeToStandart(sB, StringFunction<Ascii>::getLength(sB));

	ConsoleAttribute::setTextColor(CONSOLE_TEXT_COLOR_DEFAULT);

	const charAscii* s3 = "[Test] Background Color :\n";

	Console<Ascii>::writeToStandart(s3, StringFunction<Ascii>::getLength(s3));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_RED);
	Console<Ascii>::writeToStandart(sR, StringFunction<Ascii>::getLength(sR));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_GREEN);
	Console<Ascii>::writeToStandart(sG, StringFunction<Ascii>::getLength(sG));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_BLUE);
	Console<Ascii>::writeToStandart(sB, StringFunction<Ascii>::getLength(sB));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_DEFAULT);


	const charAscii* s4 = "[Test] UTF8 Encodage :\n";
	const charAscii* s4_1 = u8"[Test] [\xc2\xb6]\n";
	const charAscii* s4_2 = u8"[Test] [\xe0\xa4\x84]\n";
	const charAscii* s4_3 = u8"[Test] [\xe1\x84\x80]\n";
	Console<Ascii>::writeToStandart(s4, StringFunction<Ascii>::getLength(s4));
	Console<Utf8>::writeToStandart(s4_1, StringFunction<Utf8>::getLength(s4_1));
	Console<Utf8>::writeToStandart(s4_2, StringFunction<Utf8>::getLength(s4_2));
	Console<Utf8>::writeToStandart(s4_3, StringFunction<Utf8>::getLength(s4_3));

}
