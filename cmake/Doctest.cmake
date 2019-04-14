if(ENABLE_DOCTESTS)
    add_definitions(-DENABLE_DOCTEST_IN_LIBRARY)
endif()

add_library(doctest INTERFACE)
target_include_directories(doctest INTERFACE ${PROJECT_SOURCE_DIR}/external/doctest/doctest)
