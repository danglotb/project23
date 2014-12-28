#ifndef _COLLECTION_STRING_H
#define _COLLECTION_STRING_H

#include <string>

#include "collection/Header.h"
#include "collection/AllocPolicies.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		template<typename T>
		class BasicString {

		public:
			BasicString(unsigned int p_size) : _size(p_size) {

			}

			unsigned int size() const {
				return _size;
			}

		protected:
			unsigned int _size;

		};

		template<typename T>
		class _String : public BasicString<T> {



		};

		template<
				typename T,
				template<class> class AllocPolicy = SeparateHeapAlloc
				>
		class _ConstantString : public BasicString<T> {

		public:
			_ConstantString(const char* string) : _ConstantString(string, std::strlen(string)) {

			}

		private:
			_ConstantString(const char* string, unsigned int size) : BasicString<T>(size), _alloc(size) {
				std::memcpy(_alloc.getAddress(0), string, size*sizeof(T));
			}

			AllocPolicy<T> _alloc;

		};

		template<typename T>
		class _ReferenceString : public BasicString<T> {

		public:
			_ReferenceString(const char* string) : _ReferenceString(string, std::strlen(string)) {

			}

		private:
			_ReferenceString(const char* string, unsigned int p_size) : BasicString<T>(p_size), _string(string) {

			}

			const char* _string;

			template<typename T1>
			friend std::ostream& operator<<(std::ostream& stream, const _ReferenceString<T1>& element);

		};

		template<typename T>
		std::ostream& operator<<(std::ostream& stream, const _ReferenceString<T>& element) {
			stream.write(element._string, element._size);
			return stream;
		}

		typedef _String<char> String;
		typedef _ConstantString<char> ConstantString;
		typedef _ReferenceString<char> ReferenceString;
	}
}

#endif
