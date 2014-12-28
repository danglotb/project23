#ifndef _UTILITY_NONCOPYABLE_H
#define _UTILITY_NONCOPYABLE_H

#include "utility/Header.h"

namespace GLOBAL_NS {

	namespace UTILITY_NS {

		class NonCopyable {

		public:
			NonCopyable();
			~NonCopyable();

		private:
			NonCopyable(const NonCopyable& target);
			NonCopyable& operator=(const NonCopyable& target);


		};
	}
}

#endif

