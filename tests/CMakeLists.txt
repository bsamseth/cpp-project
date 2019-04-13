cmake_minimum_required(VERSION 3.8.2)

# List all files containing tests. (Change as needed)
set(TESTFILES        # All .cpp files in tests/
    main.cpp
    dummy.cpp
)

set(TEST_MAIN unit_tests)   # Default name for test executable (change if you wish).
set(TEST_RUNNER_PARAMS "")  # Any arguemnts to feed the test runner (change as needed).

# --------------------------------------------------------------------------------
#                         Make Tests (no change needed).
# --------------------------------------------------------------------------------
add_library(doctest INTERFACE)
target_include_directories(doctest INTERFACE ${PROJECT_SOURCE_DIR}/external/doctest/doctest)
# Optional, but nice (see https://github.com/onqtam/doctest/blob/master/doc/markdown/configuration.md#doctest_config_super_fast_asserts)
add_definitions(-DDOCTEST_CONFIG_SUPER_FAST_ASSERTS)  

add_executable(${TEST_MAIN} ${TESTFILES})
target_link_libraries(${TEST_MAIN} PRIVATE ${LIBRARY_NAME} doctest)
set_target_properties(${TEST_MAIN} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

set_target_properties(${TEST_MAIN} PROPERTIES 
    CXX_STANDARD 17 
    CXX_STANDARD_REQUIRED YES 
    CXX_EXTENSIONS NO
)

add_custom_target(test 
    COMMAND ${PROJECT_BINARY_DIR}/${TEST_MAIN} ${TEST_RUNNER_PARAMS}
    DEPENDS ${TEST_MAIN})

# Adds a 'coverage' target.
include(CodeCoverage)

