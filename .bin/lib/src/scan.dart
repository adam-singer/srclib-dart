library scanner;

import "package:srclib_dart/src/data_model/source_unit.dart";
import "package:srclib_dart/docgen/src/generator.dart" as docgen_generator;

// scan (scanners) 
class Scan {
  final Uri repo; 
  final String subdirectoryPath;
  final Map config;
  final SourceUnit sourceUnit;
  Scan(this.repo, this.subdirectoryPath, this.config) : 
    sourceUnit = new SourceUnit() {
    sourceUnit.dir = subdirectoryPath;
    sourceUnit.dependencies = new List<Map>();
  }
  
  run() {
    sourceUnit.files = docgen_generator.findLibrariesToDocument([subdirectoryPath], false);
  }
  
}  
