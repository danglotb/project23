#ifndef _UTILITY_SINGLETON_MANAGER_H
#define _UTILITY_SINGLETON_MANAGER_H

#include <stack>

#include "utility/Header.h"
#include "utility/Singleton.h"

namespace GLOBAL_NS {

	namespace UTILITY_NS {

		/*
		 * Without Manager
		 */
		template<typename T>
		class SingletonWithoutManager {

		public:
            static T* getInstance() {
                return _instance;
            }

            static T* createInstance() {
                _instance = new T;
                return _instance;
			}

            static void destroyInstance() {
                delete _instance;
            }

        private:
            static T* _instance;

		};

        template<typename T>
        T* SingletonWithoutManager<T>::_instance = nullptr;

		/*
		 *	Desfault Manager
		 */

		class SingletonManagerHandler {

		public:

			static void add(void(*destroyHandler)()) {
				_destroyHandlers.push(destroyHandler);
			}

			static void destroyAll() {
				while(!_destroyHandlers.empty()) {
					_destroyHandlers.top()();
					_destroyHandlers.pop();
				}
			}

		private:
			static std::stack<void(*)()> _destroyHandlers;

		};


		template<typename T>
		class SingletonDefaultManager {

		public:
            static T* getInstance() {
                return _instance;
            }

            static T* createInstance() {
                SingletonManagerHandler::add(SingletonDefaultManager<T>::destroyHandler);
				_instance = new T;
				return _instance;
			}

		private:

            static void destroyInstance() {

            }

            static void destroyHandler() {
                delete _instance;
            }

			static T* _instance;

		};

		template<typename T>
		T* SingletonDefaultManager<T>::_instance = nullptr;

	}
}



#endif
