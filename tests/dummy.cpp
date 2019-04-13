#include "doctest.h"
#include "example.h"

TEST_CASE("dummies always return true")
{
  Dummy d;
  CHECK(d.doSomething() == true);
}
