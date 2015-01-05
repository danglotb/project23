#include "global/Header.h"

#include "core/Core.h"
#include "core/ThirdPart.h"

#include "utility/SingletonManager.h"

#include "collection/Buffer.h"
#include "collection/String.h"

#include "output/LogManager.h"
#include "output/LogOutput.h"

#include "output/Report.h"

#include <vector>
#include <iostream>

using namespace GLOBAL_NS;

class A {

public:
	A(unsigned int p_id) {
		id = p_id;
		std::cout << "A Construct " << id << "(" << this << ")" << std::endl;
	}

	~A() {
		std::cout << "A Destruct" << id << "(" << this << ")" << std::endl;
	}

	A(const A& target) {
		id = target.id;
		std::cout << "A Copy Construct " << id << " from " << target.id << "(" << this << "->" << &target << ")" << std::endl;
	}

	A& operator=(const A& target) {
		id = target.id;
		std::cout << "A Copy Assign " << id << " from " << target.id << "(" << this << "->" << &target << ")" << std::endl;
		return *this;
	}

	unsigned int id;

	friend std::ostream& operator<<(std::ostream& stream, const A& element);

};

std::ostream& operator<<(std::ostream& stream, const A& element) {
	char buffer[32];
	unsigned int size = snprintf(buffer, 32, "%d", element.id);
	stream.write(buffer, size);
	return stream;
}

class B : public UTILITY_NS::NonCopyable {
public:
	B() {
		std::cout << "B Construct " << this << std::endl;
	}

	~B() {
		std::cout << "B Destruct" << this << std::endl;
	}
};

int main() {

	OUTPUT_NS::LogManager::instance().initialize();

	CORE_NS::ThirdPart::initialize();

	CORE_NS::Core::instance().run();


	//Destorying managed singleton
	UTILITY_NS::SingletonManagerHandler::destroyAll();

	OUTPUT_NS::lstd.duplicate(new OUTPUT_NS::LogFile("log"));


	CORE_NS::ThirdPart::destroy();

	OUTPUT_NS::LogManager::instance().destroy();
    OUTPUT_NS::LogManager::destroy();

	return 0;
}
