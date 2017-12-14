/*
 *  Distributed under the MIT License (See accompanying file /LICENSE )
 */
#include "calc.h"
#include "logger.h"
#include "clara.hpp"
#include <iostream>

struct CliArgs {
    std::vector<std::string> calculations;
};

int main(int argc, char *argv[]) {
  
  // Define command line arguments
  CliArgs args;
  using namespace clara;
  bool showHelp = false;
  auto parser
    = Help( showHelp )
    | Arg( args.calculations, "calc calc_string" )
        ( "the string to be calculated" );

  // Parse command line arguments into the args constructor
  auto result = parser.parse( Args( argc, argv ) );
  if( !result ) {
    std::cerr << "Error in command line: " << result.errorMessage() << std::endl;
    exit(1);
  } else if ( showHelp ) {
    std::cout << parser;
    exit(0);
  }

  using namespace ModernCppCI;
  Logger::level(LogLevel::info);
  Logger log{__func__};
  Calc calc;
  log.info("doing some calculation");

  for( std::string calculation: args.calculations) {
    std::istringstream parts(calculation);
    std::string part;
    while ( parts >> part) {
      try   {
        int i = std::stoi(part);
        calc = calc << i;
      }
      catch( std::invalid_argument & e ){
          calc = calc << part.c_str();
      }
    }
  }

  log.info(calc);

  return 0;
}
