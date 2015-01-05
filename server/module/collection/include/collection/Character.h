#ifndef _COLLECTION_CHARACTER_H
#define _COLLECTION_CHARACTER_H

#include "collection/Header.h"

namespace GLOBAL_NS {

	namespace COLLECTION_NS {

		template<typename T>
		class Character {

		public:
			static const char LineFeed;

			static unsigned int getSize(const T*);

		};

		/*
		 * char Specialization
		 */

		template<>
		class Character<char> {

		public:
			static const char Null = '\0';

			static const char LineFeed = '\n';

			static const char Hyphens = '-';

			static const char Zero = '0';
			static const char One = '1';
			static const char Two = '2';
			static const char Three = '3';
			static const char Four = '4';
			static const char Five = '5';
			static const char Six = '6';
			static const char Seven = '7';
			static const char Height = '8';
			static const char Nine = '9';

			static const char A = 'A';
			static const char B = 'B';
			static const char C = 'C';
			static const char D = 'D';
			static const char E = 'E';
			static const char F = 'F';


			static unsigned int getSize(const char* string) {
				unsigned int size = 0;
				while(string[size] != Null)
					size++;
				return size;
			}

		};

	}
}

#endif
