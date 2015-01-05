#include "output/LogOutput.h"

#include <iostream>

using namespace GLOBAL_NS;
using namespace OUTPUT_NS;

void LogStd::write(const void* data, unsigned int size) {
	ConsoleIO::writeToStandartOutput(data, size);
}

void LogError::write(const void* data, unsigned int size) {
	ConsoleIO::writeToStandartError(data, size);
}

AbstractLogFile::AbstractLogFile() {

}

AbstractLogFile::~AbstractLogFile() {

}

LogFile::LogFile(const COLLECTION_NS::ReferenceString& pathname) {
	_file.open(pathname.getData(), std::ios::out | std::ios::trunc);
}

LogFile::~LogFile() {

}

void LogFile::destroy() {
	_file.close();
}

void LogFile::write(const void* data, unsigned int size) {
	_file.write((const char*)data, size);
}

