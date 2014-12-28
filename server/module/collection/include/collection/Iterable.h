#ifndef _COLLECTION_ITERABLE_H
#define _COLLECTION_ITERABLE_H

#include "collection/Header.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		class Iterable {

		};

		template<
			typename T,
			template<class> class IteratorInternal
			>
		class Iterator {

		public:
			Iterator(const Iterable& iterable) : _iterator(iterable) {

			}

			const T& next() {
				return _iterator.next();
			}

			bool hasNext() {
				return _iterator.hasNext();
			}

		private:
			IteratorInternal<T> _iterator;

		};


	}
}
#endif
