# This file specifies how the project should be built, using CMake.
# If you are unfamiliar with CMake, don't worry about all the details.
# The sections you might want to edit are marked as such, and 
# the comments should hopefully make most of it clear.
#
# For many purposes, you may not need to change anything about this file.

cmake_minimum_required(VERSION 3.8.2)

# Set project name, version and laguages here. (change as needed)
# Version numbers are available by including "exampleConfig.h" in 
# the source. See exampleConfig.h.in for some more details.
project(CPP_BOILERPLATE VERSION 1.2.3.4 LANGUAGES CXX)


# Include stuff. No change needed.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
include(ConfigSafeGuards)
include(Colors)


# --------------------------------------------------------------------------------
#                         Locate files (change as needed).
# --------------------------------------------------------------------------------
set(SOURCES          # All .cpp files in src/
    src/example.cpp
)
set(TESTFILES        # All .cpp files in tests/
    tests/main.cpp
)
set(LIBRARY_NAME engine1)  # Default name for the library built from src/*.cpp (change if you wish)

# --------------------------------------------------------------------------------
#                            Build! (Change as needed)
# --------------------------------------------------------------------------------
# Compile all sources into a library.
add_library(${LIBRARY_NAME} ${SOURCES})

# Lib needs its header files, and users of the library must also see these (PUBLIC). (No change needed)
target_include_directories(${LIBRARY_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)

# Set the compile options you want, possibly depending on compiler (change as needed).
# Do similar for the executables if you wish to set options for them as well.
target_compile_options(${LIBRARY_NAME} PRIVATE 
                           # clang/GCC warnings
                           $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:GNU>>: 
                           "-Wall" "-Wextra" >
                           # MSVC warnings
                           $<$<CXX_COMPILER_ID:MSVC>: 
                           "/Wall" >
)

# Add an executable for the file app/main.cpp.
# If you add more executables, copy these lines accordingly.
add_executable(main app/main.cpp)   # Name of exec. and location of file.
target_link_libraries(main PRIVATE ${LIBRARY_NAME})  # Link the executable to library (if it uses it).

# Set the properties you require, e.g. what C++ standard to use. Here applied to library and main.x (change as needed).
set_target_properties(
    ${LIBRARY_NAME} main 
      PROPERTIES 
        CXX_STANDARD 17 
        CXX_STANDARD_REQUIRED YES 
        CXX_EXTENSIONS NO
)


# Set up tests (see tests/CMakeLists.txt).
add_subdirectory(tests)


# --------------------------------------------------------------------------------
#                         Documentation (no change needed).
# --------------------------------------------------------------------------------
# Add a make target 'doc' to generate API documentation with Doxygen.
# You should set options to your liking in the file 'Doxyfile.in'.
find_package(Doxygen)
if(DOXYGEN_FOUND)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)
    add_custom_target(doc 
        ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile &> doxygen.log
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "${BoldMagenta}Generating API documentation with Doxygen (open ./html/index.html to view).${ColourReset}" VERBATIM
    )
endif(DOXYGEN_FOUND)


# --------------------------------------------------------------------------------
#                            Misc (no change needed).
# --------------------------------------------------------------------------------
# Have CMake parse the config file, generating the config header, with
# correct definitions. Here only used to make version number available to
# the source code. Include "exampleConfig.h" (no .in suffix) in the source.
configure_file (
  "${PROJECT_SOURCE_DIR}/include/exampleConfig.h.in"
  "${PROJECT_BINARY_DIR}/exampleConfig.h"
)
# add the binary tree to the search path for include files
# so that we will find exampleConfig.h
include_directories("${PROJECT_BINARY_DIR}")

# Ask CMake to output a compile_commands.json file for use with things like Vim YCM.
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
