#ifndef _COLLECTION_CONVERSION_H
#define _COLLECTION_CONVERSION_H

#include "collection/Header.h"
#include "collection/String.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {
		class Conversion {

		public:
			template<typename TChar>
			static const _Stream<TChar> intToString(int numeric, NumericBase base = NUMERIC_BASE_DEDCIMAL) {
				return _Stream<TChar>::fromSignedNumeric(numeric, base);
			}

			template<typename TChar>
			static const _Stream<TChar> uintToString(unsigned int numeric, NumericBase base = NUMERIC_BASE_HEXADECIMAL) {
				return _Stream<TChar>::fromUnsignedNumeric(numeric, base);
			}

			template<typename TChar>
			static const _Stream<TChar> longToString(long numeric, NumericBase base = NUMERIC_BASE_HEXADECIMAL) {
				return _Stream<TChar>::fromSignedNumeric(numeric, base);
			}

			template<typename TChar>
			static const _Stream<TChar> ulongToString(unsigned long numeric, NumericBase base = NUMERIC_BASE_HEXADECIMAL) {
				return _Stream<TChar>::fromUnsignedNumeric(numeric, base);
			}

			template<typename TChar>
			static const _Stream<TChar> ptrToString(void* ptr) {
				return _Stream<TChar>::fromUnsignedNumeric((CAST_POINTER_TO_INTEGER)ptr, NUMERIC_BASE_HEXADECIMAL);
			}
		};

	}

}

#endif
