# CMake build : third party

#configure directories
set (THIRD_PARTY_MODULE_PATH "${PROJECT_SOURCE_DIR}/third_party")

#BEGIN:THIRD_PARTY_DEPS
# -------------------------------------------------------------------------
# catch

#configure directories
set (CATCH2_MODULE_PATH "${THIRD_PARTY_MODULE_PATH}/Catch2")
set (CATCH2_INCLUDE_PATH "${CATCH2_MODULE_PATH}/single_include")

#include custom cmake function
include ( "${CATCH2_MODULE_PATH}/contrib/ParseAndAddCatchTests.cmake")

# -------------------------------------------------------------------------
# spdlog

#configure directories
set (SPDLOG_MODULE_PATH "${THIRD_PARTY_MODULE_PATH}/spdlog")
set (SPDLOG_INCLUDE_PATH "${SPDLOG_MODULE_PATH}/include")

# -------------------------------------------------------------------------
# Clara

#configure directories
set (CLARA_MODULE_PATH "${THIRD_PARTY_MODULE_PATH}/Clara")
set (CLARA_INCLUDE_PATH "${CLARA_MODULE_PATH}/single_include")

# -------------------------------------------------------------------------
#END:THIRD_PARTY_DEPS


#set variables
set (THIRD_PARTY_INCLUDE_PATH ${SPDLOG_INCLUDE_PATH} ${CLARA_INCLUDE_PATH})

#set variables for tests
set (TEST_THIRD_PARTY_INCLUDE_PATH  ${CATCH2_INCLUDE_PATH})

#export vars
set (THIRD_PARTY_INCLUDE_PATH  ${THIRD_PARTY_INCLUDE_PATH} PARENT_SCOPE)
set (TEST_THIRD_PARTY_INCLUDE_PATH  ${TEST_THIRD_PARTY_INCLUDE_PATH} PARENT_SCOPE)