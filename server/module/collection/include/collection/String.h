#ifndef _COLLECTION_STRING_H
#define _COLLECTION_STRING_H

#include <cstdio>

#include "collection/Header.h"
#include "collection/AllocPolicies.h"
#include "collection/Character.h"
#include "collection/Stream.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		template<typename T>
		class BasicString {

		public:
			BasicString(unsigned int p_size) : _size(p_size) {

			}

			unsigned int getSize() const {
				return _size;
			}

		protected:
			unsigned int _size;

		};

		template<typename T>
		class _ReferenceString : public BasicString<T> {

		public:
			_ReferenceString(const char* string) : _ReferenceString(string, std::strlen(string)) {

			}

			const T* getData() const {
				return _string;
			}

		private:
			_ReferenceString(const char* string, unsigned int p_size) : BasicString<T>(p_size), _string(string) {

			}

			const char* _string;

		};
/*
		template<
				typename T,
				template<class> class AllocPolicy = SeparateHeapAlloc
				>
		class _ConstantString : public BasicString<T> {

		public:
			_ConstantString(const char* string) : _ConstantString(string, std::strlen(string)) {

			}

			const T* getData() const {
				return _alloc.getAddress(0);
			}

		private:
			_ConstantString(const char* string, unsigned int size) : BasicString<T>(size), _alloc(size) {
				std::memcpy(_alloc.getAddress(0), string, size*sizeof(T));
			}

			AllocPolicy<T> _alloc;

		};

		typedef _ConstantString<char> ConstantString;
*/
		template<
				typename TChar,
				template<class> class AllocPolicy = SeparateHeapAlloc
				>
		class _String : public _OutputStream<TChar, AllocPolicy> {

		public:
			_String() : _OutputStream<TChar, AllocPolicy>() {

			}

			_String(const TChar* string) : _String(string, Character<TChar>::getSize(string)) {

			}
/*
			const T* getData() const {
				return _alloc.getAddress(0);
			}

			void append(const T* string, unsigned int size) {
				_alloc.realloc(BasicString<T>::_size+size+1);

				std::memcpy(_alloc.getAddress(BasicString<T>::_size), string, size+1);

				BasicString<T>::_size += size;
			}

			void append(const T* string) {
				unsigned int size = 0;
				while(string[size] != Character<T>::endOfString)
					size++;
				append(string, size);
			}

			_String<T,AllocPolicy>&  operator<<(const char* string) {
				_ReferenceString<T> ref_string(string);
				append(ref_string.getData(), ref_string.getSize());
				return *this;
			}

			_String<T,AllocPolicy>&  operator<<(int integer) {
				char buffer[INT_MAX_CHAR+1];
				std::snprintf(buffer, INT_MAX_CHAR, "%d", integer);
				append(buffer);
				return *this;
			}

			_String<T,AllocPolicy>&  operator<<(unsigned int uinteger) {
				char buffer[INT_MAX_CHAR+1];
				std::snprintf(buffer, INT_MAX_CHAR, "%u", uinteger);
				append(buffer);
				return *this;
			}

			_String<T,AllocPolicy>&  operator<<(long integer) {
				char buffer[LONG_MAX_CHAR+1];
				std::snprintf(buffer, INT_MAX_CHAR, "%ld", integer);
				append(buffer);
				return *this;
			}

			_String<T,AllocPolicy>&  operator<<(unsigned long uinteger) {
				char buffer[LONG_MAX_CHAR+1];
				std::snprintf(buffer, INT_MAX_CHAR, "%lu", uinteger);
				append(buffer);
				return *this;
			}

			_String<T,AllocPolicy>&  operator<<(void* ptr) {
				char buffer[PTR_MAX_CHAR+1];
				std::snprintf(buffer, INT_MAX_CHAR, "%p", ptr);
				append(buffer);
				return *this;
			}
*/
		private:
			_String(const TChar* string, unsigned int size) : _OutputStream<TChar, AllocPolicy>() {
				_OutputStream<TChar, AllocPolicy>::append(string, size);
			}

		};


		typedef _String<char> String;
		typedef _ReferenceString<char> ReferenceString;


	}
}

#endif
