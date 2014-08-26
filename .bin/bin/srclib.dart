#!/usr/bin/env dart

import 'dart:io';
import 'dart:convert' show JSON;

import 'package:unscripted/unscripted.dart';
import 'package:logging/logging.dart';

class SrcLibDriver {
  final File _logFile = new File("/tmp/srclib.dart.log");
  final Logger _logger = new Logger("SrcLibDriver");
  
  @Command(help: '')
  SrcLibDriver() {
    // TODO(adam): remove when better logging happens. 
    _logFile.open(mode: FileMode.WRITE);
    _logger.onRecord.listen((LogRecord r) {
      _logFile.writeAsStringSync("${r.toString()}\n");
    });
  }
  
  @SubCommand(help: 'Tools that perform the scan operation are called scanners. '
    'They scan a directory tree and produce a JSON array of source units ' 
    '(in Go, []*unit.SourceUnit) they encounter.')
  scan({@Option(help: 'the URI of the repository that contains the directory '
     'tree being scanned')
        String repo : '',
        @Option(help: """the path of the current directory (in which the '
     'scanner is run), relative to the root directory of the repository being '
     'scanned (this is typically the root, ".", as it is most useful to scan '
     'the entire repository)""")
        String subdir: ''}) {
    // depresolve expects json list
    _logger.info("subdir = ${subdir}");
    _logger.info("repo = ${repo}");
    _logger.info("cwd = " + Directory.current.absolute.path);
    
    print('{}');
  }
    
  @SubCommand(help: 'Tools that perform the dep operation are called dependency'
    ' resolvers. They resolve "raw" dependencies, such as the name and version '
    'of a dependency package, into a full specification of the dependency\'s '
    'target.')
  depresolve() {
    // depresolve expects json list 
    print('[]');
  }
  
  @SubCommand(help: 'Tools that perform the graph operation are called graphers.'
    ' Depending on the programming language of the source code they analyze, '
    'they perform a combination of parsing, static analysis, semantic analysis, '
    'and type inference. Graphers perform these operations on a source unit and'
    ' have read access to all of the source unit\'s files.')
  graph() {
    // depresolve expects json map
    print('{}');
  }
  
  @SubCommand(help: 'This command for human-readable info describing the '
    'version, author, etc. (free-form)')
  info() {
    print(JSON.encode({"author": "Adam Singer <financecoding@gmail.com>", 
      "version": "0.0.1-dev"}));
  }
}

main(arguments) => declare(SrcLibDriver).execute(arguments);
