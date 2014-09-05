#!/usr/bin/env dart

import 'dart:async';
import 'dart:io';
import 'dart:convert' show JSON, UTF8, LineSplitter;

import 'package:unscripted/unscripted.dart';
import 'package:logging/logging.dart';

import 'package:srclib_dart/srclib.dart';

class SrcLibDriver {
  final File _logFile = new File("/tmp/srclib.dart.log");
  final Logger _logger = new Logger("SrcLibDriver");
  final List<String> _stdinLines = new List<String>();
  String _info = JSON.encode({"author": "Adam Singer <financecoding@gmail.com>", 
    "version": "0.0.1-dev"});
  
  @Command(help: '')
  SrcLibDriver() {
    _logFile.open(mode: FileMode.WRITE);
    Logger.root.onRecord.listen((LogRecord r) {
      _logFile.writeAsStringSync("${r.toString()}\n");
    });
  }
  
  Stream _readLine() => stdin
    .transform(UTF8.decoder)
    .transform(new LineSplitter());
  
  void _processInput(Function onDone) {
    _readLine().listen(_stdinLines.add,
        onError: (error) => _logger.severe(error.toString()), 
        onDone: onDone, 
        cancelOnError: true); 
  }
  
  void _processFile(String filePath, Function onDone) {
    File file = new File(filePath);
    String data = file.readAsStringSync();
    _stdinLines.add(data);
    onDone();
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
        String subdir: '',
        @Option(help: 'Override reading stdin and use a test data file.')
        String testDataFile: null}) {
    
    // depresolve expects json list
    _logger.info("subdir = ${subdir}");
    _logger.info("repo = ${repo}");
    _logger.info("cwd = " + Directory.current.absolute.path);
    
    void startScan() {
      Map config = JSON.decode(_stdinLines.join());
      _logger.info("repositoryConfig = ${config}");
      Scan scan = new Scan(Uri.parse(repo), subdir, config);
      String result = scan.execute();
      stdout.write(result);
      stdout.flush().then((_) => stdout.close());
    }
    
    if (testDataFile == null) {
      _processInput(startScan);
    } else {
      _logger.warning("using test data file ");
      _processFile(testDataFile, startScan);
    }
    
    
  }
    
  @SubCommand(help: 'Tools that perform the dep operation are called dependency'
    ' resolvers. They resolve "raw" dependencies, such as the name and version '
    'of a dependency package, into a full specification of the dependency\'s '
    'target.')
  depresolve({@Option(help: 'Override reading stdin and use a test data file.')
    String testDataFile: null}) {
    // depresolve expects json list 
    void startDepresolve() {
      Map sourceUnit = JSON.decode(_stdinLines.join());
      _logger.info("sourceUnit = ${sourceUnit}");
      print('[]');
    }

    if (testDataFile == null) {
      _processInput(startDepresolve);
    } else {
      _logger.warning("using test data file ");
      _processFile(testDataFile, startDepresolve);
    }
    
  }
  
  @SubCommand(help: 'Tools that perform the graph operation are called graphers.'
    ' Depending on the programming language of the source code they analyze, '
    'they perform a combination of parsing, static analysis, semantic analysis, '
    'and type inference. Graphers perform these operations on a source unit and'
    ' have read access to all of the source unit\'s files.')
  graph({@Option(help: 'Override reading stdin and use a test data file.')
    String testDataFile: null}) {
    // graph expects json map
    void startGraph() {
      Map sourceUnit = JSON.decode(_stdinLines.join());
      _logger.info("sourceUnit = ${sourceUnit}");
      print('{}');
    }

    if (testDataFile == null) {
      _processInput(startGraph);
    } else {
      _logger.warning("using test data file ");
      _processFile(testDataFile, startGraph);
    }
  }
  
  @SubCommand(help: 'This command for human-readable info describing the '
    'version, author, etc. (free-form)')
  info() => print(_info);
  
}

void main(arguments) => declare(SrcLibDriver).execute(arguments);
