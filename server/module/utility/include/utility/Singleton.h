#ifndef _UTILITY_SINGLETON_H
#define _UTILITY_SINGLETON_H

#include "utility/Header.h"
#include "utility/NonCopyable.h"

namespace GLOBAL_NS {

	namespace UTILITY_NS {


		template<typename T>
		class SingletonWithoutManager; //forward declare

		template<
			typename T,
			template<class> class Manager = SingletonWithoutManager
				 >
		class Singleton {

		public:

			static T& instance() {
				if(_instance == nullptr)
					_instance = _manager.createInstance();

				return *_instance;
			}

		protected:
			Singleton() {

			}

			~Singleton() {

			}

		private:

			static T* _instance;
			static Manager<T> _manager;

		};

		template<typename T, template<class> class Manager>
		T* Singleton<T, Manager>::_instance = nullptr;

		template<typename T, template<class> class Manager>
		Manager<T> Singleton<T, Manager>::_manager;
	}

}

#endif
