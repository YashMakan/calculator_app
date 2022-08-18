import 'package:args/args.dart';
import 'package:calculator_app/src/calculator.dart';

class CalculatorAppParser {
  static String get version => '0.0.1';

  static String get description =>
      'A command line interface for calculator_app';

  static String get usage => 'calculator_app [options]';

  static String get help => '''
  calculator_ap is a command line interface to calculator two numbers.
  ''';

  static void parse(List<String> arguments) {
    final parser = ArgParser()
      ..addOption('add', abbr: 'a', help: 'Add two numbers', valueHelp: 'num')
      ..addOption('sub',
          abbr: 's', help: 'Subtract two numbers', valueHelp: 'num')
      ..addOption('mul',
          abbr: 'm', help: 'Multiply two numbers', valueHelp: 'num')
      ..addOption('div',
          abbr: 'd', help: 'Divide two numbers', valueHelp: 'num')
      ..addFlag('help', abbr: 'h', help: 'Shows this help')
      ..addFlag('version', abbr: 'v', help: 'Shows the version');

    final results = parser.parse(arguments);

    if (results.arguments.isEmpty) {
      print(parser.usage);
      return;
    } else if (results.arguments.contains('help')) {
      print(parser.usage);
    } else if (results.arguments.contains('version')) {
      print(version);
    } else if (results.arguments.contains('add')) {
      Calculator.add(double.parse(results.arguments[1]),
          double.parse(results.arguments[2]));
    } else if (results.arguments.contains('sub')) {
      Calculator.sub(double.parse(results.arguments[1]),
          double.parse(results.arguments[2]));
    } else if (results.arguments.contains('mul')) {
      Calculator.mul(double.parse(results.arguments[1]),
          double.parse(results.arguments[2]));
    } else if (results.arguments.contains('div')) {
      Calculator.div(double.parse(results.arguments[1]),
          double.parse(results.arguments[2]));
    } else {
      print('No command specified ${results.arguments}');
    }
  }
}
