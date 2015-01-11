#ifndef _CLIFF_LOW_LEVEL_CHARACTER_H
#define _CLIFF_LOW_LEVEL_CHARACTER_H

#include "cliff/low_level/Header.h"
#include "cliff/type/PrimitiveType.h"
#include "cliff/type/TypeToType.h"

namespace CLIFF {

	template<typename Encodage>
	class Character {

	public:
		static const typename Encodage::type Null;
	};

	///
	///	ASCII
	///

	typedef CLIFF_8_BIT_TYPE charAscii;

	class Ascii {

	public:
		typedef charAscii type;
	};



	template<>
	class Character<Ascii> {

	public:
		static const charAscii Null;
	};

	///
	///	UTF-8
	///

	typedef CLIFF_8_BIT_TYPE charUtf8;

	class Utf8 {

	public:
		typedef charUtf8 type;
	};

	template<>
	class Character<Utf8> {

	public:
		static const charUtf8 Null;
	};


}

#endif
