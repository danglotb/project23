#ifndef _COLLECTION_STREAM_H
#define _COLLECTION_STREAM_H

#include "collection/Header.h"

#include "collection/AllocPolicies.h"
#include "collection/Character.h"
#include "collection/StreamModifier.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		template<
			typename TChar,
			template<class> class AllocPolicy = SeparateHeapAlloc
			>
		class _Stream {

		public:
			_Stream() : _alloc(1), _size(0) {
				*_alloc.getAddress(0) = Character<TChar>::Null;
			}

			_Stream(const TChar* stream) : _Stream(stream, Character<TChar>::getSize(stream)) {

			}

			_Stream(const TChar* stream, unsigned int size) : _alloc(size+1), _size(size) {
				std::memcpy(_alloc.getAddress(0), stream, size*sizeof(TChar));
				*_alloc.getAddress(size) = Character<TChar>::Null;
			}

			void append(const TChar& streamUnit) {
				_alloc.realloc(_size+2);

				*_alloc.getAddress(_size) = streamUnit;
				*_alloc.getAddress(_size+1) = Character<TChar>::Null;
				_size++;
			}

			void append(const TChar* streamArray, unsigned int length) {
				_alloc.realloc(_size+length+1);

				std::memcpy(_alloc.getAddress(_size), streamArray, length);
				*_alloc.getAddress(_size+length) = Character<TChar>::Null;
				_size += length;
			}

			void append(const TChar* streamArray) {
				append(streamArray, Character<TChar>::getSize(streamArray));
			}

			template<template<class> class AllocPolicy1>
			void append(const _Stream<TChar, AllocPolicy1>& stream) {
				append(stream.getData(), stream.getSize());
			}

			void clear() {
				_size = 0;
				*_alloc.getAddress(0) = Character<TChar>::Null;
			}

			unsigned int getSize() const {
				return _size;
			}

			const TChar* getData() const {
				return _alloc.getAddress(0);
			}


			template<typename TNum>
			static _Stream<TChar, AllocPolicy> fromUnsignedNumeric(TNum integer, NumericBase base) {
				TChar buffer[sizeof(TNum)*8+1];
				return _fromNumeric(buffer, integer, base);
			}

			template<typename TNum>
			static _Stream<TChar, AllocPolicy> fromSignedNumeric(TNum integer, NumericBase base) {
				TChar buffer[sizeof(TNum)*8+1];

				if(integer < 0) {
					buffer[0] = Character<TChar>::Hyphens;
					return _fromNumeric(buffer+1, -integer, base);
				}
				else {
					return _fromNumeric(buffer, integer, base);
				}
			}

		protected:
			AllocPolicy<TChar> _alloc;
			unsigned int _size;

		private:
			template<typename TNum>
			static _Stream<TChar, AllocPolicy> _fromNumeric(TChar* buffer, TNum integer, NumericBase base) {
				unsigned int buffer_cursor = 0;

				while(integer != 0) {
					switch(integer % (int)base) {
						case 0:
							buffer[buffer_cursor++] = Character<TChar>::Zero;
							break;
						case 1:
							buffer[buffer_cursor++] = Character<TChar>::One;
							break;
						case 2:
							buffer[buffer_cursor++] = Character<TChar>::Two;
							break;
						case 3:
							buffer[buffer_cursor++] = Character<TChar>::Three;
							break;
						case 4:
							buffer[buffer_cursor++] = Character<TChar>::Four;
							break;
						case 5:
							buffer[buffer_cursor++] = Character<TChar>::Five;
							break;
						case 6:
							buffer[buffer_cursor++] = Character<TChar>::Six;
							break;
						case 7:
							buffer[buffer_cursor++] = Character<TChar>::Seven;
							break;
						case 8:
							buffer[buffer_cursor++] = Character<TChar>::Height;
							break;
						case 9:
							buffer[buffer_cursor++] = Character<TChar>::Nine;
							break;
						case 10:
							buffer[buffer_cursor++] = Character<TChar>::A;
							break;
						case 11:
							buffer[buffer_cursor++] = Character<TChar>::B;
							break;
						case 12:
							buffer[buffer_cursor++] = Character<TChar>::B;
							break;
						case 13:
							buffer[buffer_cursor++] = Character<TChar>::D;
							break;
						case 14:
							buffer[buffer_cursor++] = Character<TChar>::E;
							break;
						case 15:
							buffer[buffer_cursor++] = Character<TChar>::F;
							break;
					}
					integer /= (int)base;
				}

				return _Stream<TChar, AllocPolicy>(buffer, buffer_cursor);
			}

		};

		template<
			typename TChar,
			template<class> class AllocPolicy = SeparateHeapAlloc
			>
		class _OutputStream : public _Stream<TChar, AllocPolicy> {

		public:
			_OutputStream() : _numericBase(NUMERIC_BASE_DEDCIMAL) {

			}

			template<
					template<class> class AllocPolicy1
					>
			_OutputStream<TChar,AllocPolicy>& operator<<(const _Stream<TChar, AllocPolicy1>& stream) {
				_Stream<TChar, AllocPolicy>::append(stream.getData(), stream.getSize());
				return *this;
			}

			_OutputStream<TChar,AllocPolicy>& operator<<(const TChar* string) {
				_Stream<TChar, AllocPolicy>::append(string, Character<TChar>::getSize(string));
				return *this;
			}


			_OutputStream<TChar,AllocPolicy>&  operator<<(int integer) {
				_Stream<TChar, AllocPolicy>::append(_Stream<TChar, AllocPolicy>::fromSignedNumeric(integer, _numericBase));
				return *this;
			}

			_OutputStream<TChar,AllocPolicy>&  operator<<(unsigned int uinteger) {
				_Stream<TChar, AllocPolicy>::append(_Stream<TChar, AllocPolicy>::fromUnsignedNumeric(uinteger, _numericBase));
				return *this;
			}

			_OutputStream<TChar,AllocPolicy>&  operator<<(long integer) {
				_Stream<TChar, AllocPolicy>::append(_Stream<TChar, AllocPolicy>::fromSignedNumeric(integer, _numericBase));
				return *this;
			}

			_OutputStream<TChar,AllocPolicy>&  operator<<(unsigned long uinteger) {
				_Stream<TChar, AllocPolicy>::append(_Stream<TChar, AllocPolicy>::fromUnsignedNumeric(uinteger, _numericBase));
				return *this;
			}

			_OutputStream<TChar,AllocPolicy>&  operator<<(void* ptr) {
				_Stream<TChar, AllocPolicy>::append(_Stream<TChar, AllocPolicy>::fromUnsignedNumeric((CAST_POINTER_TO_INTEGER)ptr, NUMERIC_BASE_HEXADECIMAL));
				return *this;
			}

			template<typename Modifier>
			_OutputStream<TChar,AllocPolicy>&  operator<<(const StreamModifier<Modifier>&  modifier) {
				modifier.process(*this);
				return *this;
			}



			private:
				NumericBase _numericBase;

		};
	}
}

#endif
