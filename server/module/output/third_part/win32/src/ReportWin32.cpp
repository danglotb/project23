#include "output/ReportWin32.h"

using namespace GLOBAL_NS;
using namespace OUTPUT_NS;

ReportWin32::Symbol::Symbol() {
	info.MaxNameLen = MAX_SYMBOL_NAME_LENGTH;
	info.SizeOfStruct = sizeof(Symbol);
}

LONG WINAPI ReportWin32::ExceptionHandler(PEXCEPTION_POINTERS exception) {

	PEXCEPTION_RECORD record = exception->ExceptionRecord;
	PCONTEXT context = exception->ContextRecord;

	lerr << "[Exception] "  << getExceptionMessage(record);// << COLLECTION_NS::endl;


	lerr << printSystemConfiguration();// << COLLECTION_NS::endl;

	BOOL use_symbole = SymInitialize(GetCurrentProcess(), 0, TRUE);

	if(!use_symbole) {
		lerr << "Unable to initialize Symmbole";//  << COLLECTION_NS::endl;
	}

	lerr << printStackTrace(context, GetCurrentThread(),  use_symbole);// << COLLECTION_NS::endl;

	std::abort();

	return EXCEPTION_CONTINUE_EXECUTION;
}

const COLLECTION_NS::String ReportWin32::getExceptionMessage(PEXCEPTION_RECORD exceptionRecord) {

#define MESSAGE_EXCEPTION(E_CODE) case E_CODE: return COLLECTION_NS::String(#E_CODE)

	switch(exceptionRecord->ExceptionCode) {
		case EXCEPTION_ACCESS_VIOLATION:
			{
				COLLECTION_NS::String str("ACCESS VIOLATION : ");
				switch(exceptionRecord->ExceptionInformation[0]) {
					case 0:
						str << "Read";
						break;
					case 1:
						str << "Write";
						break;
					case 8:
						str << "DEP";
						break;
				}
				str << ", Virtual address fault : " << (void*)exceptionRecord->ExceptionInformation[1];


				return str;
			}
		MESSAGE_EXCEPTION(EXCEPTION_ARRAY_BOUNDS_EXCEEDED);
		MESSAGE_EXCEPTION(EXCEPTION_BREAKPOINT);
		MESSAGE_EXCEPTION(EXCEPTION_DATATYPE_MISALIGNMENT);
		MESSAGE_EXCEPTION(EXCEPTION_FLT_DENORMAL_OPERAND);
		MESSAGE_EXCEPTION(EXCEPTION_FLT_DIVIDE_BY_ZERO);
		MESSAGE_EXCEPTION(EXCEPTION_FLT_INEXACT_RESULT);
		MESSAGE_EXCEPTION(EXCEPTION_FLT_INVALID_OPERATION);
		MESSAGE_EXCEPTION(EXCEPTION_FLT_OVERFLOW);
		MESSAGE_EXCEPTION(EXCEPTION_FLT_STACK_CHECK);
		MESSAGE_EXCEPTION(EXCEPTION_FLT_UNDERFLOW);
		MESSAGE_EXCEPTION(EXCEPTION_ILLEGAL_INSTRUCTION);
		MESSAGE_EXCEPTION(EXCEPTION_IN_PAGE_ERROR);
		MESSAGE_EXCEPTION(EXCEPTION_INT_DIVIDE_BY_ZERO);
		MESSAGE_EXCEPTION(EXCEPTION_INT_OVERFLOW);
		MESSAGE_EXCEPTION(EXCEPTION_INVALID_DISPOSITION);
		MESSAGE_EXCEPTION(EXCEPTION_NONCONTINUABLE_EXCEPTION);
		MESSAGE_EXCEPTION(EXCEPTION_PRIV_INSTRUCTION);
		MESSAGE_EXCEPTION(EXCEPTION_SINGLE_STEP);
		MESSAGE_EXCEPTION(EXCEPTION_STACK_OVERFLOW);
	}

	return COLLECTION_NS::String("Undefined Excption");
}

COLLECTION_NS::String ReportWin32::printSystemConfiguration() {

	COLLECTION_NS::String output;

	output << "System Configuration Report \n";

	SYSTEM_INFO general_info;

	output << "Operating System : Windows\n";

	GetSystemInfo(&general_info);

	output << "Processor Architecture : ";
	switch(general_info.wProcessorArchitecture) {
		case PROCESSOR_ARCHITECTURE_AMD64:
			output << "AMD64";
			break;
		case PROCESSOR_ARCHITECTURE_ARM:
			output << "ARM";
			break;
		case PROCESSOR_ARCHITECTURE_IA64:
			output << "IA64";
			break;
		case PROCESSOR_ARCHITECTURE_INTEL:
			output << "x86";
			break;
		default:
			output << "Unknown";
	}
	output << "\n";


	MEMORYSTATUS memory_info;
	GlobalMemoryStatus(&memory_info);

	output << "Physical Memory Usage : " << (int)memory_info.dwMemoryLoad << "%\n";
	output << "Total Physical Memory : " << (unsigned int)memory_info.dwTotalPhys << "\n";
	output << "Physical Memory Avaible : " << (unsigned int)memory_info.dwAvailPhys << "\n";
	output << "Total Virtual Memory : " << (unsigned int)memory_info.dwTotalVirtual << "\n";
	output << "Physical Virtual Avaible : " << (unsigned int)memory_info.dwAvailVirtual << "\n";


	output << "Page size : " << (int)general_info.dwPageSize << "\n";



	return output;
}

COLLECTION_NS::String ReportWin32::printStackTrace(PCONTEXT context, HANDLE thread, BOOL useSymbole) {
	COLLECTION_NS::String output;
	STACKFRAME64 current_frame;
	HANDLE process = GetCurrentProcess();


	lerr << (unsigned long)context->Rsp;//  << COLLECTION_NS::endl;
	lerr << (unsigned long)context->Rbp;//  << COLLECTION_NS::endl;

#if defined(ARCHITECTURE_AMD64)
	current_frame.AddrPC.Offset = context->Rip;
	current_frame.AddrPC.Mode = AddrModeFlat;
	current_frame.AddrStack.Offset = context->Rsp;
	current_frame.AddrStack.Mode = AddrModeFlat;
	current_frame.AddrFrame.Offset = context->Rbp;
	current_frame.AddrFrame.Mode = AddrModeFlat;
	#define STACK_ARCH_TYPE IMAGE_FILE_MACHINE_AMD64
#else
	#error Uncompatible Architecture
#endif
	unsigned int cursor = 0;

	while(StackWalk64(STACK_ARCH_TYPE, process, thread, &current_frame, &context, nullptr, SymFunctionTableAccess64, SymGetModuleBase64, nullptr)) {

		if(current_frame.AddrPC.Offset == 0) {
			break;
		}

		DWORD64 displacement = 0;
		Symbol symbol;
		if(!useSymbole || !SymFromAddr(process, current_frame.AddrPC.Offset, &displacement, (PSYMBOL_INFO)(&symbol))) {

			output << cursor << ":" << (unsigned long)current_frame.AddrPC.Offset << "\n";
		}
		else {
			output << cursor << ":" << symbol.name << "\n";
		}
		cursor++;

	}

	return output;
}

