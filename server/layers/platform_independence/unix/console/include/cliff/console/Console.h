#ifndef _CLIFF_PLATFORM_INDEPENDENCE_CONSOLE_H
#define _CLIFF_PLATFORM_INDEPENDENCE_CONSOLE_H

#include "cliff/platform_independence/Header.h"
#include "cliff/console/ConsoleHeader.h"
#include "cliff/type/PrimitiveType.h"
#include "cliff/type/Character.h"
#include "cliff/program_control/Exception.h"

namespace CLIFF {


    class ConsoleAttribute {

    public:
        static void setTextColor(ConsoleTextColor color);
        static void setBackgroundColor(ConsoleBackgroundColor color);

    private:
        static void changeTextAttribute();

        static ConsoleTextColor _currentTextColor;
        static ConsoleBackgroundColor _currentBackgroundColor;

    };

    template<typename Encodage>
    class Console {

    public:

        static void writeToStandart(const typename Encodage::type* buffer, uint32 length) {

        }

        static void writeToError(const typename Encodage::type* buffer, uint32 length) {

        }

    private:
        Console();
        //TODO Non-copyable
    };

    template<>
    class Console<Ascii> {

    public:
        static void writeToStandart(const charAscii* buffer, uint32 length);
    };

    template<>
    class Console<Utf8> {

    public:
        static void writeToStandart(const charUtf8* buffer, uint32 length);
    };
}

#endif
