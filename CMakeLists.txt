# CMake build : global project
cmake_minimum_required (VERSION 3.3)
# auto-define the project name based on the parent directory
get_filename_component(ProjectId ${CMAKE_CURRENT_LIST_DIR} NAME)
string(REPLACE " " "_" ProjectId ${ProjectId})

set (CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")
include(cotire)

project (${ProjectId})

set_property (GLOBAL PROPERTY USE_FOLDERS ON)

set (CMAKE_CXX_STANDARD 14)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

set (THREADS_PREFER_PTHREAD_FLAG ON)
find_package (Threads REQUIRED)

add_subdirectory (third_party EXCLUDE_FROM_ALL)
add_subdirectory (lib)
add_subdirectory (app)


enable_testing ()