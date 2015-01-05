#ifndef _COLLECTION_STREAM_MODIFIER_H
#define _COLLECTION_STREAM_MODIFIER_H

#include "collection/Header.h"
#include "collection/Character.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		enum NumericBase {
			NUMERIC_BASE_BINARY = 2,
			NUMERIC_BASE_OCTAL = 8,
			NUMERIC_BASE_DEDCIMAL = 10,
			NUMERIC_BASE_HEXADECIMAL = 16
		};

		template<
			typename T,
			template<class> class AllocPolicy
			>
		class _Stream;

		template<typename TModifier>
		class StreamModifier {

		public:
			template<
				typename TChar,
				template<class> class AllocPolicy
				>
			static void process(_Stream<TChar, AllocPolicy>& stream) {
				TModifier::process(stream);
			}
		};


		class _EndLine {

		public:

			template<
				typename TChar,
				template<class> class AllocPolicy
				>
			static void process(_Stream<TChar, AllocPolicy>& stream) {
				stream.append(Character<TChar>::LineFeed);
			}

		};

		class _Hexa {

		public:

			template<
				typename TChar,
				template<class> class AllocPolicy
				>
			static void process(_Stream<TChar, AllocPolicy>& stream) {
				stream.setNumericBase(NUMERIC_BASE_HEXADECIMAL);
			}

		};

		extern StreamModifier<_EndLine> endl;
		extern StreamModifier<_Hexa> hexa;
	}
}

#endif
