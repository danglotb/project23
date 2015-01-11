#ifndef _CLIFF_LOW_LEVEL_CONTEXT_H
#define _CLIFF_LOW_LEVEL_CONTEXT_H

#include "cliff/low_level/Header.h"

#include "cliff/type/PrimitiveType.h"

namespace CLIFF {

	class StackContext {

	public:
		struct Frame {
			void* bp;
			void* sp;
		};

		static void save(Frame& frame);
		static void restore(const Frame& frame);

	};
}

#endif
