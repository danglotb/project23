#ifndef _CLIFF_LOW_LEVEL_STRING_INFO_H
#define _CLIFF_LOW_LEVEL_STRING_INFO_H

#include "cliff/low_level/Header.h"
#include "cliff/type/Character.h"

namespace CLIFF {

	template<typename Encodage>
	class StringFunction {

	public:
		static uint32 getLength(const typename Encodage::type* string);

		static uint32 getByteSize(const typename Encodage::type* string)  {
			uint32 size = 0;
			while(string[size] != Character<Encodage>::Null) {
				size += sizeof(typename Encodage::type);
			}
			return size;
		}


	};

	///
	///	ASCII
	///

	template<>
	uint32 StringFunction<Ascii>::getLength(const charAscii* string);

	///
	///	UTF-8
	///

	template<>
	uint32 StringFunction<Utf8>::getLength(const charUtf8* string);
}

#endif
