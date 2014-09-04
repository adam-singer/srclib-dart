
import "package:unittest/unittest.dart";

import "package:srclib_dart/src/data_model/source_unit.dart";
import "package:srclib_dart/src/srclib_encoder.dart";

void main() {  
  group("Scan", () {
    test("encode files", () {
      SourceUnit sourceUnit = new SourceUnit();
      sourceUnit.files = ["file1.dart", "file2.dart", "file3.dart"];
      SrcLibEncoder srcLibEncoder = new SrcLibEncoder();
      String encoded = srcLibEncoder.encode(sourceUnit);
      String expected = '''{"Name":null,"Type":null,"Repo":null,"Globs":null,"Files":["file1.dart","file2.dart","file3.dart"],"Dir":null,"Dependencies":null,"Info":null,"Data":null,"Config":null,"Ops":null}''';
      expect(encoded, isNotNull);
      expect(encoded, equals(expected));
      sourceUnit = srcLibEncoder.decode(encoded, SourceUnit);
      expect(sourceUnit, isNotNull);
      expect(sourceUnit.files, isNotNull);
      expect(sourceUnit.files.length, equals(3));
      expect(sourceUnit.files[0], equals("file1.dart"));
      expect(sourceUnit.files[1], equals("file2.dart"));
      expect(sourceUnit.files[2], equals("file3.dart"));
    });
  });
}
