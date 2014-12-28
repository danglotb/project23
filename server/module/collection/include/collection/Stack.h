#ifndef _COLLECTION_STACK_H
#define _COLLECTION_STACK_H

#include "collection/Header.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

	template<typename T>
	class Stack {

	public:
		void push(const T& element);
		T& pop();

	};

	}
}

#endif
