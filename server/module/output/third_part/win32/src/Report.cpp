#include "output/Report.h"

#include <Windows.h>

using namespace GLOBAL_NS;
using namespace OUTPUT_NS;

COLLECTION_NS::String Report::printSystemConfiguration() {


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

COLLECTION_NS::String Report::printStackTrace() {
	COLLECTION_NS::String output;

	output << "Stack Trace Report \n";

	return output;
}
