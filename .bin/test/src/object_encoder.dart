
import "package:unittest/unittest.dart";

import "package:srclib_dart/src/data_model/source_unit.dart";
import "package:srclib_dart/src/srclib_encoder.dart";

void main() {  
  group("Scan", () {
    test("files property", () {
      SourceUnit sourceUnit = new SourceUnit();
      // TODO(adam): fails cause jsonx might not know how to encode Uri. 
      // consider making the properies really simple PODOs
      sourceUnit.files = [Uri.parse("file1.dart"), Uri.parse("file2.dart"), 
                          Uri.parse("file3.dart")];
      
      SrcLibEncoder srcLibEncoder = new SrcLibEncoder();
      String encoded = srcLibEncoder.encode(sourceUnit);
      expect(encoded, isNotNull);
      
      sourceUnit = srcLibEncoder.decode(encoded, SourceUnit);
      expect(sourceUnit, isNotNull);
    });
  });
}
