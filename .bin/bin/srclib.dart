#!/usr/bin/env dart

// TODO(adam): consider using this as the actual driver and the top level `srclib-dart` script
// as a simple redirecting script

//import 'dart:io';

import 'package:unscripted/unscripted.dart';
//import 'package:path/path.dart' as path;

class SrcLibDriver {
  @Command(help: '')
  SrcLibDriver();
  
  @SubCommand(help: 'Tools that perform the scan operation are called scanners. They scan a directory tree and produce a JSON array of source units (in Go, []*unit.SourceUnit) they encounter.')
  scan({@Option(help: 'the URI of the repository that contains the directory tree being scanned')
        String repo : '',
        @Option(help: """the path of the current directory (in which the scanner is run), relative to the root directory of the repository being scanned (this is typically the root, ".", as it is most useful to scan the entire repository)""")
        String subdir: ''}) {
    print('');
  }
    
  @SubCommand(help: 'Tools that perform the dep operation are called dependency resolvers. They resolve "raw" dependencies, such as the name and version of a dependency package, into a full specification of the dependency\'s target.')
  depresolve() {
    print('');
  }
  
  @SubCommand(help: 'Tools that perform the graph operation are called graphers. Depending on the programming language of the source code they analyze, they perform a combination of parsing, static analysis, semantic analysis, and type inference. Graphers perform these operations on a source unit and have read access to all of the source unit\'s files.')
  graph() {
    print('');
  }
  
  @SubCommand(help: 'This command for human-readable info describing the version, author, etc. (free-form)')
  info() {
    print('');
  }
}

main(arguments) => declare(SrcLibDriver).execute(arguments);
