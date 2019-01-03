[![Build Status](https://travis-ci.org/bsamseth/cpp-project.svg?branch=master)](https://travis-ci.org/bsamseth/cpp-project)
[![Coverage Status](https://coveralls.io/repos/github/bsamseth/cpp-project/badge.svg?branch=master)](https://coveralls.io/github/bsamseth/cpp-project?branch=master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/eb004322b0d146239a57eb242078e179)](https://www.codacy.com/app/bsamseth/cpp-project?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=bsamseth/cpp-project&amp;utm_campaign=Badge_Grade)
[![Language grade: C/C++](https://img.shields.io/lgtm/grade/cpp/g/bsamseth/cpp-project.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/bsamseth/cpp-project/context:cpp)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/bsamseth/cpp-project.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/bsamseth/cpp-project/alerts/)
[![license](https://img.shields.io/badge/license-Unlicense-blue.svg)](https://github.com/bsamseth/cpp-project/blob/master/LICENSE)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/bsamseth/cpp-project.svg)](http://isitmaintained.com/project/bsamseth/cpp-project "Average time to resolve an issue")
[![Percentage of issues still open](http://isitmaintained.com/badge/open/bsamseth/cpp-project.svg)](http://isitmaintained.com/project/bsamseth/cpp-project "Percentage of issues still open")

# Boiler plate for C++ projects 

This is a boiler plate for C++ projects. What you get:

-   Sources, headers and mains separated in distinct folders
-   Access to [Google Tests](https://github.com/google/googletest)
-   Use of [CMake](https://cmake.org/) for much easier compiling
-   Continuous testing with [Travis-CI](https://travis-ci.org/), with support for C++17.
-   Code coverage reports, including automatic upload to [Coveralls.io](https://coveralls.io/)
-   Code documentation with [Doxygen](http://www.stack.nl/~dimitri/doxygen/)

![Demo of usage](https://i.imgur.com/foymVfy.gif)

## Structure
``` text
.
├── CMakeLists.txt
├── app
│   └── main.cpp
├── include
│   ├── example.h
│   └── exampleConfig.h.in
├── src
│   └── example.cpp
└── tests
    ├── dummy.cpp
    └── main.cpp
```

Sources go in [src/](src/), header files in [include/](include/), main programs in [app/](app), and
tests go in [tests/](tests/) (compiled to `unit_tests.x` by default). 

If you add a new executable, say `app/hello.cpp`, you only need to add the following three lines to [CMakeLists.txt](CMakeLists.txt): 

``` cmake
add_executable(hello.x app/hello.cpp)   # Name of exec. and location of file.
add_dependencies(hello.x engine)        # engine is the library built from src/*.cpp
target_link_libraries(hello.x engine)   # Link the executable to the 'engine'.
```

You can find the example that builds the example in [app/main.cpp](app/main.cpp) under the `Build` section in [CMakeLists.txt](CMakeLists.txt). 
If the executable you made does not use the library in [src/](src), then only the first line is needed.



## Building

Build by making a build directory (i.e. `build/`), run `cmake` in that dir, and then use `make` to build the desired target.

Example:

``` bash
> mkdir build && cd build
> cmake .. -DCMAKE_BUILD_TYPE=[Debug | Coverage | Release]
> make
> ./main.x
> make gtest     # Makes and runs the tests.
> make coverage  # Generate a coverage report.
> make doc       # Generate html documentation.
```

## .gitignore

The [.gitignore](.gitignore) file is a copy of the [Github C++.gitignore file](https://github.com/github/gitignore/blob/master/C%2B%2B.gitignore),
with the addition of ignoring the build directory (`build/`).

## Services

If repository is activated with Travis-CI, then unit tests will be built and executed on each commit.

If repository is activated with Coveralls, then deployment to Travis will also calculate code coverage and
upload this to Coveralls.io. 

## Setup
When starting a new project, you probably don't want the history of this repository. To start fresh you can use
the [setup script](setup.sh) as follows:
``` bash
> git clone https://github.com/bsamseth/cpp-project  # Or use ssh-link if you like.
> cd cpp-project
> sh setup.sh
```
The result is a fresh Git repository with one commit adding all files from the boiler plate. 
