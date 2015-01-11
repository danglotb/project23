#ifndef _CLIFF_PRIMITIVE_TYPE_H
#define _CLIFF_PRIMITIVE_TYPE_H

#include "cliff/low_level/Header.h"

namespace CLIFF {

	///
	///	Generic TypeInfo template
	///
	template<typename Type>
	class TypeInfo {

	public:
		static const Type minLimit;
		static const Type maxLimit;
	};

	#ifndef CLIFF_POINTER_SIZE
	#	error	Missing CLIFF_POINTER_SIZE
	#endif

	#ifndef CLIFF_CHAR_SIZE
	#	error	Missing CLIFF_CHAR_SIZE
	#endif

	#ifndef CLIFF_SHORT_SIZE
	#	error	Missing CLIFF_SHORT_SIZE
	#endif

	///
	///	8 bit type
	///

	#if CLIFF_CHAR_SIZE == 1
	#	define	CLIFF_8_BIT_TYPE char
	#else
	#	error Unable to find 8 bit type
	#endif

	typedef unsigned CLIFF_8_BIT_TYPE uint8;
	template<>
	class TypeInfo<uint8> {

	public:
		static const uint8 minLimit;
		static const uint8 maxLimit;
	};

	typedef signed CLIFF_8_BIT_TYPE int8;
	template<>
	class TypeInfo<int8> {

	public:
		static const int8 minLimit;
		static const int8 maxLimit;
	};

	///
	/// 16 bit type
	///

	#if CLIFF_SHORT_SIZE == 2
	#	define	CLIFF_16_BIT_TYPE short
	#else
	#	error Unable to find 16 bit type
	#endif

	typedef unsigned CLIFF_16_BIT_TYPE uint16;
	template<>
	class TypeInfo<uint16> {

	public:
		static const uint16 minLimit;
		static const uint16 maxLimit;
	};

	typedef signed CLIFF_16_BIT_TYPE int16;
	template<>
	class TypeInfo<int16> {

	public:
		static const int16 minLimit;
		static const int16 maxLimit;
	};

	///
	/// 32 bit type
	///

	#if CLIFF_INT_SIZE == 4
	#	define	CLIFF_32_BIT_TYPE int
	#else
	#	error Unable to find 32 bit type
	#endif

	typedef unsigned CLIFF_32_BIT_TYPE uint32;
	template<>
	class TypeInfo<uint32> {

	public:
		static const uint32 minLimit;
		static const uint32 maxLimit;
	};

	typedef signed CLIFF_32_BIT_TYPE int32;
	template<>
	class TypeInfo<int32> {

	public:
		static const int32 minLimit;
		static const int32 maxLimit;
	};

	///
	/// 64 bit type
	///

	#if CLIFF_LONG_SIZE == 8
	#	define	CLIFF_64_BIT_TYPE long
	#elif CLIFF_LONG_LONG_SIZE == 8
	#	define	CLIFF_64_BIT_TYPE long long
	#else
	#	error Unable to find 64 bit type
	#endif

	typedef unsigned CLIFF_64_BIT_TYPE uint64;
	template<>
	class TypeInfo<uint64> {

	public:
		static const uint64 minLimit;
		static const uint64 maxLimit;
	};

	typedef signed CLIFF_64_BIT_TYPE int64;
	template<>
	class TypeInfo<int64> {

	public:
		static const int64 minLimit;
		static const int64 maxLimit;
	};



}

#endif
