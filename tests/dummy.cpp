#include "doctest.h"
#include "example.h"

// Tests that don't naturally fit in the headers/.cpp files directly
// can be placed in a tests/*.cpp file. Integration tests are a good example.

TEST_CASE("complicated integration tests could be here")
{
  Dummy d;
  CHECK(d.doSomething() == true);
}
