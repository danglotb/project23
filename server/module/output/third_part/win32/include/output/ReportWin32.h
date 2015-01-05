#ifndef _OUTPUT_REPORT_WIN32_H
#define _OUTPUT_REPORT_WIN32_H

#include "windows.h"
#include "imagehlp.h"

#include "output/Header.h"
#include "output/Report.h"
#include "output/LogManager.h"

namespace GLOBAL_NS {

	namespace OUTPUT_NS {

		class ReportWin32 {

		public:
			static LONG WINAPI ExceptionHandler(PEXCEPTION_POINTERS pExceptionInfo);
			static COLLECTION_NS::String printSystemConfiguration();
			static COLLECTION_NS::String printStackTrace(PCONTEXT context, HANDLE thread, BOOL useSymbole);

		private:
			class Symbol {
			public:
				Symbol();
				SYMBOL_INFO info;
#define MAX_SYMBOL_NAME_LENGTH 128
				char name[MAX_SYMBOL_NAME_LENGTH];
			};

			static const COLLECTION_NS::String getExceptionMessage(PEXCEPTION_RECORD exceptionRecord);

		};
	}
}

#endif
