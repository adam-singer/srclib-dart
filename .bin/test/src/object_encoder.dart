
import "package:unittest/unittest.dart";

import "package:jsonx/jsonx.dart";

String toSrcLibCase(String input) =>
    input[0].toUpperCase() + input.substring(1);

String fromSrcLibCase(String input) =>
    input[0].toLowerCase() + input.substring(1);

@jsonObject
class TestObject {
  @jsonProperty String dir;
  @jsonProperty String sourceFile;
}

void main() {
  propertyNameEncoder = toSrcLibCase;
  propertyNameDecoder = fromSrcLibCase;
  group("jsonx", () {
    test("simple", () {
      TestObject testObject = new TestObject()
      ..dir = "."
      ..sourceFile = "file.dart";
      expect(encode(testObject), equals('{"Dir":".","SourceFile":"file.dart"}'));
    });
  });  
}
