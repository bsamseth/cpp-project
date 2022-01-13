if(ENABLE_DOCTESTS)
    add_definitions(-DENABLE_DOCTEST_IN_LIBRARY)
    include(FetchContent)
    FetchContent_Declare(
            DocTest
            GIT_REPOSITORY "https://github.com/onqtam/doctest"
            GIT_TAG "7b9885133108ae301ddd16e2651320f54cafeba7"
    )

    FetchContent_MakeAvailable(DocTest)
    include_directories(${DOCTEST_INCLUDE_DIR})
endif()
