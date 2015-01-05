#ifndef OUTPUT_LOG_OUTPUT_H
#define OUTPUT_LOG_OUTPUT_H

#include <fstream>

#include "output/Header.h"
#include "output/ConsoleIO.h"

#include "collection/String.h"

namespace GLOBAL_NS {

	namespace OUTPUT_NS {

		class LogOutput {


		};

		class LogStd {

		public:
			void write(const void* data, unsigned int size);

		};

		class LogError {

		public:
			void write(const void* data, unsigned int size);
		};

		class AbstractLogFile {
		public:
			AbstractLogFile();
			~AbstractLogFile();


		};

		class LogFile : public LogOutput {

		public:
			LogFile(const COLLECTION_NS::ReferenceString& pathname);
			~LogFile();

			void initialize();
			void destroy();
			void write(const void* data, unsigned int size);

		private:
			std::ofstream _file;

		};
	}
}

#endif
