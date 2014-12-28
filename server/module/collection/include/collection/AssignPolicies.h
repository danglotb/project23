#ifndef _COLLECTION_ASSIGN_POLICIES_H
#define _COLLECTION_ASSIGN_POLICIES_H

#include <cstdint>
#include <cstring>

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

	template<typename T>
	class AssignByConstructCopy {

	public:
		static void initialize(const T& element, T* target) {
			new(target) T(element);
		}


		static void initializeArray(const T& element, void* target, unsigned int number) {
			for(unsigned int i=0; i<number; i++) {
				new((T*)target+i) T(element);
			}
		}

		static void destroy(const T& element) {
			element.~T();
		}

		static void destroyArray(void* target, unsigned int number) {
			for(unsigned int i=0; i<number; i++) {
				((T*)target+i)->~T();
			}
		}

	};

	template<typename T>
	class AssignByMemoryCopy {

	public:
		static void initialize(const T& element, T* target) {
			std::memcpy(target, &element, sizeof(T));
		}

		static void initializeArray(const T& element, void* target, unsigned int number) {
			for(unsigned int i=0; i<number; i++) {
				std::memcpy((T*)target+i, &element, sizeof(T));
			}
		}

		static void destroy(UNUSED_PARAMETER(const T& element)) {

		}

		static void destroyArray(UNUSED_PARAMETER(void* target), UNUSED_PARAMETER(unsigned int number)) {

		}

	};

	}

}

#endif
