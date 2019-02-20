#include "example.h"

Dummy::Dummy() {

}

bool Dummy::doSomething() {
    // Do a silly test, but using if constexpr to enforce C++17 builds only.
    if constexpr (1 + 1 > 1)
        return true;
    else
        return false;
}
