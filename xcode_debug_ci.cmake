cmake_minimum_required(VERSION 3.5)
set(CTEST_PROJECT_NAME "Drafter")
set(CTEST_BUILD_NAME "OSX/debug")

set(CTEST_SOURCE_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}")
set(CTEST_BINARY_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/build")

set(CTEST_USE_LAUNCHERS 1)

set(CTEST_CMAKE_GENERATOR "Unix Makefiles")

set(Drafter_CONFIG_OPTIONS
    "-DCMAKE_BUILD_TYPE=Debug"
    "-DINTEGRATION_TESTS=ON"
    )

ctest_start("Continuous")
ctest_configure(OPTIONS "${Drafter_CONFIG_OPTIONS}")
ctest_build(FLAGS -j5)
ctest_test()
ctest_submit()
