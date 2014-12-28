#ifndef _COLLECTION_BUFFER_H
#define _COLLECTION_BUFFER_H

#include <cstdint>

#include "collection/Header.h"
#include "collection/AssignPolicies.h"
#include "collection/AllocPolicies.h"
#include "collection/exception/OutOfRangeException.h"
#include "collection/Iterable.h"

#include <iostream>

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

	/**
	 * A reallocable buffer of type T
	 */
	template<
			typename T,
			template<class> class AssignPolicy = AssignByConstructCopy,
			template<class> class AllocPolicy = SeparateHeapAlloc
			>
	class Buffer : public Iterable {

	public:

		Buffer() : _size(0) {

		}

		~Buffer() {
			for(unsigned int i=0; i<_size; i++) {
				AssignPolicy<T>::destroy(*_alloc.getAddress(i));
			}
		}

		void requireSize(unsigned int p_size) {
			if(p_size > _size) {
				_alloc.realloc(p_size);
			}
		}

		/**
		 * @brief set an element at position in the buffer
		 * @param element
		 * @param position
		 */
		void set(const T& element, unsigned int position) {
			IF_DEBUG_2 (
				if(position >= _size) {
					throw OutOfRangeException(position, _size);
				}
			)
			AssignPolicy<T>::destroy(*_alloc.getAddress(position));
			AssignPolicy<T>::initialize(element, _alloc.getAddress(position));
		}

		const T& get(unsigned int position) const {
			IF_DEBUG_2 (
				if(position >= _size) {
					throw OutOfRangeException(position, _size);
				}
			)
			return *_alloc.getAddress(position);
		}

		/**
		 * @briefpsh an element at end of the buffer
		 * @param element
		 * @param position
		 */
		void push(const T& element) {
			requireSize(_size+1);

			AssignPolicy<T>::initialize(element, _alloc.getAddress(_size));

			_size++;
		}

		unsigned int size() const {
			return _size;
		}

		/**
		 * @brief print the each element contain in the buffer
		 */
		void print() {
			for(unsigned int i=0; i<_size; i++) {
				std::cout << *_alloc.getAddress(i) << std::endl;
			}
		}

		/*
		 * Iterator
		 */
		template<typename T1>
		class BufferIterator {

		public:
			BufferIterator(const Iterable& collection) : _collection((const Buffer&)collection), cursor(0) {

			}

			const T1& next() {
				return _collection.get(cursor++);
			}

			bool hasNext() {
				return cursor < _collection.size();
			}

		private:
			const Buffer& _collection;
			unsigned int cursor;
		};

		Iterator<T, BufferIterator> iterator() {
			return Iterator<T, BufferIterator>(*this);
		}

	private:
		AllocPolicy<T> _alloc;

		unsigned int _size;

	};

	/**
	 * A buffer of type T with a constante size
	 */
	template<
			typename T,
			unsigned int Size,
			template<class> class AssignPolicy = AssignByConstructCopy
			>
	class ConstantBuffer : public Iterable {

	public:
		/**
		 * @brief ConstantBuffer construct a buffer of Size element T intialized by T default constructor
		 */
		ConstantBuffer() {
			AssignPolicy<T>::initializeArray(T(), _buffer, Size);
		}

		/**
		 * @brief ConstantBuffer construct a buffer of Size element T intialized by element
		 * @param element
		 */
		ConstantBuffer(const T& element) {
			AssignPolicy<T>::initializeArray(element, _buffer, Size);
		}

		/**
		 * @brief ~ConstantBuffer destroy the whole buffer element
		 */
		~ConstantBuffer() {
			AssignPolicy<T>::destroyArray(_buffer, Size);
		}

		/**
		 * @brief set an element at position in the buffer
		 * @param element
		 * @param position
		 */
		void set(const T& element, unsigned int position) {
			IF_DEBUG_2 (
				if(position >= Size) {
					throw OutOfRangeException(position, Size);
				}
			)
			AssignPolicy<T>::destroy(*((T*)_buffer+position));
			AssignPolicy<T>::initialize(element, (T*)_buffer+position);
		}

		const T& get(unsigned int position) const {
			IF_DEBUG_2 (
				if(position >= Size) {
					throw OutOfRangeException(position, Size);
				}
			)
			return *((T*)_buffer+position);
		}

		unsigned int size() const {
			return Size;
		}

		/**
		 * @brief print the each element contain in the buffer
		 */
		void print() {
			for(unsigned int i=0; i<Size; i++) {
				std::cout << *((T*)_buffer+i) << std::endl;
			}
		}

		/*
		 * Iterator
		 */
		template<typename T1>
		class ConstantBufferIterator {

		public:
			ConstantBufferIterator(const Iterable& collection) : _collection((const ConstantBuffer&)collection), cursor(0) {

			}

			const T1& next() {
				return _collection.get(cursor++);
			}

			bool hasNext() {
				return cursor < _collection.size();
			}

		private:
			const ConstantBuffer& _collection;
			unsigned int cursor;
		};

		Iterator<T, ConstantBufferIterator> iterator() {
			return Iterator<T, ConstantBufferIterator>(*this);
		}


	private:
		uint8_t _buffer[sizeof(T)*Size];

	};

	}
}

#endif
