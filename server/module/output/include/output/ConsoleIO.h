#ifndef _OUTPUT_CONSOLE_IO_H
#define _OUTPUT_CONSOLE_IO_H

#include "output/Header.h"

namespace GLOBAL_NS {

	namespace OUTPUT_NS {

		class ConsoleIO {

		public:

			/**
			 * @brief initialize is call one time whole the program at the construction of log system
			 */
			static void initialize();

			/**
			 * @brief destroy is call one time whole the program at the destruction of the log system
			 */
			static void destroy();

			/**
			 * @brief writeToStandartOutput write to the standart console output
			 * @param stream : the stream to write
			 */

			static void writeToStandartOutput(const void* data, unsigned int size);

			/**
			 * @brief writeToStandartOutput write to the standart console error
			 * @param stream : the stream to write
			 */
			static void writeToStandartError(const void* data, unsigned int size);

		private:
			/**
			 * @brief ConsoleIO is non instantiable
			 */
			ConsoleIO();

		};
	}
}

#endif
