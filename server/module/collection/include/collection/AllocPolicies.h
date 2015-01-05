#ifndef _COLLECTION_ALLOC_POLICIES_H
#define _COLLECTION_ALLOC_POLICIES_H

#include <cstdint>
#include <cstring>
#include <cstdlib>

#include "collection/Header.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		template<typename T>
		class SeparateHeapAlloc {


		public:
			static const unsigned int start_size = 1;
			static const unsigned int realloc_power = 1;


			SeparateHeapAlloc() : _buffer((uint8_t*)std::malloc(start_size*sizeof(T))), _alloc_size(start_size) {

			}

			SeparateHeapAlloc(unsigned int size) : _buffer((uint8_t*)std::malloc(size*sizeof(T))), _alloc_size(size) {

			}

			~SeparateHeapAlloc() {
				std::free(_buffer);
			}

			void realloc(unsigned int size) {
				unsigned int old_size = _alloc_size;
				while(_alloc_size < size)
					_alloc_size <<= realloc_power;
				if(old_size < _alloc_size)
				_buffer = (uint8_t*)std::realloc(_buffer, _alloc_size*sizeof(T));
			}

			T* getAddress(unsigned int position) {
				return (T*)_buffer+position;
			}

			const T* getAddress(unsigned int position) const {
				return (T*)_buffer+position;
			}

		private:
			uint8_t* _buffer;
			unsigned int _alloc_size;

		};

	}

}

#endif
