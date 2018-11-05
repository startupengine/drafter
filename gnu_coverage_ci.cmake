cmake_minimum_required(VERSION 3.6)
set(CTEST_PROJECT_NAME "Drafter")
set(CTEST_BUILD_NAME "GNU/coverage")

set(CTEST_SOURCE_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}")
set(CTEST_BINARY_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/build")

set(CTEST_CMAKE_GENERATOR "Unix Makefiles")

set(CTEST_USE_LAUNCHERS 1)

set(CTEST_COVERAGE_COMMAND "/usr/bin/gcov")
set(CTEST_MEMORYCHECK_COMMAND "/usr/bin/valgrind")

set(Drafter_CONFIG_OPTIONS
    "-DCMAKE_CXX_FLAGS=--coverage"
    "-DCMAKE_BUILD_TYPE=Debug"
    "-DINTEGRATION_TESTS=ON"
    )

ctest_start("Continuous")
ctest_configure(OPTIONS "${Drafter_CONFIG_OPTIONS}")
ctest_build(FLAGS -j5)
ctest_test()
ctest_coverage(CAPTURE_CMAKE_ERROR COVERAGE_ERROR)
ctest_memcheck(EXCLUDE DrafterIntegration)
ctest_submit()
