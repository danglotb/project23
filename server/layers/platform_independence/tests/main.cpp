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

	ConsoleAttribute::setTextColor(CONSOLE_TEXT_COLOR_WHITE);

	const charAscii* s3 = "[Test] Background Color :\n";

	Console<Ascii>::writeToStandart(s3, StringFunction<Ascii>::getLength(s3));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_RED);
	Console<Ascii>::writeToStandart(sR, StringFunction<Ascii>::getLength(sR));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_GREEN);
	Console<Ascii>::writeToStandart(sG, StringFunction<Ascii>::getLength(sG));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_BLUE);
	Console<Ascii>::writeToStandart(sB, StringFunction<Ascii>::getLength(sB));

	ConsoleAttribute::setBackgroundColor(CONSOLE_BACKGROUND_COLOR_BLACK);


	const charAscii* s4 = u8"[Test] >>> ø <<<\n";
	Console<Utf8>::writeToStandart(s4, StringFunction<Ascii>::getLength(s4));
	std::cout << "->" << StringFunction<Ascii>::getLength(s4) << "-" << StringFunction<Utf8>::getLength(s4) << ", " << StringFunction<Utf8>::getByteSize(s4)<< std::endl;

}
