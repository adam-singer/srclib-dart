library scanner;

import 'package:logging/logging.dart';

import "package:srclib_dart/src/data_model/source_unit.dart";
import "package:srclib_dart/docgen/src/generator.dart" as docgen_generator;

// scan (scanners) 
class Scan {
  final Uri repo; 
  final String subdirectoryPath;
  final Map config;
  final SourceUnit sourceUnit;
  final Logger _logger = new Logger("Scan");
  
  Scan(this.repo, this.subdirectoryPath, this.config) : 
    sourceUnit = new SourceUnit() {
    sourceUnit.dir = subdirectoryPath;
    sourceUnit.dependencies = new List<Map>();
  }
  
  String execute() {
    _logger.info("starting scan");
    
    sourceUnit.files = docgen_generator
        .findLibrariesToDocument([subdirectoryPath], false)
        .map((Uri uri) => uri.toString()).toList();
    
    sourceUnit.dir = subdirectoryPath;
    
    _logger.info("end scan");
    String result = srcLibEncoder.encode(sourceUnit);
    _logger.info("scan result = ${result}");
    return result;
  }
}  
