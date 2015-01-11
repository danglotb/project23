#include "cliff/type/PrimitiveType.h"

using namespace CLIFF;

///
///	8 bit type
///
const uint8 CLIFF::TypeInfo<uint8>::minLimit = 0x00;
const uint8 CLIFF::TypeInfo<uint8>::maxLimit = 0xFF;

const int8 CLIFF::TypeInfo<int8>::minLimit = -0x80;
const int8 CLIFF::TypeInfo<int8>::maxLimit = 0x7F;

///
///	16 bit type
///
const uint16 CLIFF::TypeInfo<uint16>::minLimit = 0x0000;
const uint16 CLIFF::TypeInfo<uint16>::maxLimit = 0xFFFF;

const int16 CLIFF::TypeInfo<int16>::minLimit = -0x8000;
const int16 CLIFF::TypeInfo<int16>::maxLimit = 0x7F00;

///
///	32 bit type
///
const uint32 CLIFF::TypeInfo<uint32>::minLimit = 0x00000000;
const uint32 CLIFF::TypeInfo<uint32>::maxLimit = 0xFFFFFFFF;

const int32 CLIFF::TypeInfo<int32>::minLimit = -0x80000000;
const int32 CLIFF::TypeInfo<int32>::maxLimit = 0x7F000000;

///
///	64 bit type
///
const uint64 CLIFF::TypeInfo<uint64>::minLimit = 0x0000000000000000;
const uint64 CLIFF::TypeInfo<uint64>::maxLimit = 0xFFFFFFFFFFFFFFFF;

const int64 CLIFF::TypeInfo<int64>::minLimit = -0x8000000000000000;
const int64 CLIFF::TypeInfo<int64>::maxLimit = 0x7F00000000000000;
