import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_gen/flutter_generator.dart';

void main(List<String> args) {
  final parser = ArgParser();
  parser.addOption(
    'config',
    abbr: 'c',
    defaultsTo: 'pubspec_fonts.yaml',
    help: 'Set the path of pubspec_fonts.yaml.',
  );

  parser.addFlag(
    'help',
    abbr: 'h',
    help: 'Help about any command',
    defaultsTo: false,
  );

  ArgResults results;
  try {
    results = parser.parse(args);
    if (results.wasParsed('help')) {
      print(parser.usage);
      return;
    }
  } on FormatException catch (e) {
    stderr.writeAll(
        <String>[e.message, 'usage: flutter_gen [options...] ', ''], '\n');
    return;
  }

  final pubspecPath = results['config'] as String;
  FlutterGenerator(File(pubspecPath).absolute).build();
}
