#ifndef _OUTPUT_ASSIGNED_OUTPUT_STREAM_H
#define _OUTPUT_ASSIGNED_OUTPUT_STREAM_H

#include "output/Header.h"
#include "output/LogOutput.h"

#include "collection/AllocPolicies.h"
#include "collection/AssignPolicies.h"
#include "collection/Character.h"
#include "collection/Stream.h"
#include "collection/Buffer.h"
#include "collection/Conversion.h"

namespace GLOBAL_NS {

	namespace OUTPUT_NS {

		template<
			typename TChar,
			typename Output,
			template<class> class AllocPolicy = COLLECTION_NS::SeparateHeapAlloc
			>
		class _AssignedOutputStream : public COLLECTION_NS::_OutputStream<TChar, AllocPolicy> {

		public:
			_AssignedOutputStream() : _duplicate(nullptr) {

			}

			~_AssignedOutputStream() {
				flush();
				if(_duplicate != nullptr) {
					(_duplicate->*_duplicateDestroy)();
				}
			}

			void flush() {
				_output.write(COLLECTION_NS::_OutputStream<TChar, AllocPolicy>::getData(), COLLECTION_NS::_OutputStream<TChar, AllocPolicy>::getSize());

				if(_duplicate != nullptr) {
					(_duplicate->*_duplicateWrite)(COLLECTION_NS::_OutputStream<TChar, AllocPolicy>::getData(), COLLECTION_NS::_OutputStream<TChar, AllocPolicy>::getSize());
				}

				COLLECTION_NS::_OutputStream<TChar, AllocPolicy>::clear();
			}

			template<typename T1>
			void duplicate(T1* output) {
				_duplicate = output;
				_duplicateDestroy = reinterpret_cast<void(LogOutput::*)()>(&T1::destroy);
				_duplicateWrite = reinterpret_cast<void(LogOutput::*)(const void*, unsigned int)>(&T1::write);
			}

		private:
			Output _output;

			LogOutput* _duplicate;
			void(LogOutput::*_duplicateDestroy)();
			void(LogOutput::*_duplicateWrite)(const void*, unsigned int);


		};

		template <typename Output>
		using AssignedOutputStream = _AssignedOutputStream<char, Output, COLLECTION_NS::SeparateHeapAlloc>;
	}
}

#endif
