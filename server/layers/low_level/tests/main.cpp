#include "cliff/type/PrimitiveType.h"
#include "cliff/program_control/Assert.h"

using namespace CLIFF;

int c(int d) {
	Exit::failure();
	int* p = nullptr;
	*p = 0;
	return d*d;
}


int b() {
	int i;
	for(int j = 0; j<10;j++)
		i++;
	return c(i);
}

int a() {
	for(int i = 0; i<10;)
		i++;
	return b();
}

void cliffEntry() {

	//Type
	uint8 u8;
	int8 s8;

	u8 = TypeInfo<uint8>::maxLimit;
	s8 = TypeInfo<int8>::maxLimit;

	//Assert
	CLIFF_ASSERT(2*2 == 4)
	CLIFF_ASSERT(2*2 == 5)

	a();
}
