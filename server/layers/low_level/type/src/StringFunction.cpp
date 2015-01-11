#include "cliff/type/StringFunction.h"

using namespace CLIFF;

template<>
uint32 StringFunction<Ascii>::getLength(const charAscii* string) {
	uint32 size = 0;
	while(string[size] != Character<Ascii>::Null) {
		size++;
	}
	return size;
}

template<>
uint32 StringFunction<Utf8>::getLength(const charAscii* string) {
	uint32 size = 0;
	uint32 cursor = 0;
	while(string[cursor] != Character<Ascii>::Null) {
		if((string[cursor] & 0x80) == 0x0) {
			cursor++;
		}
		else if((string[cursor] & 0xE0) == 0xC0) {
			cursor += 2;
		}
		else if((string[cursor] & 0xF0) == 0xE0) {
			cursor += 3;
		}
		else {
			cursor += 4;
		}

		size++;

	}
	return size;
}
