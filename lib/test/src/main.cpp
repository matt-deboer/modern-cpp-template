/*
 *  Distributed under the MIT License (See accompanying file /LICENSE )
 */
#define CATCH_CONFIG_RUNNER
#include "catch.hpp"
#include "logger.h"

Catch::Session session;

int main(int argc, char* argv[]) {
  using namespace ModernCppCI;
  Logger::level(LogLevel::debug);

  auto result = session.run(argc, argv);

  return (result < 0xff ? result : 0xff);
}