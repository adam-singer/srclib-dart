library object_encoder;

import "package:jsonx/jsonx.dart" as jsonx;

class SrcLibEncoder {
  String _toSrcLibCase(String input) =>
      input[0].toUpperCase() + input.substring(1);

  String _fromSrcLibCase(String input) =>
      input[0].toLowerCase() + input.substring(1);
  
  SrcLibEncoder() {
    jsonx.propertyNameEncoder = _toSrcLibCase;
    jsonx.propertyNameDecoder = _fromSrcLibCase;
  }
  
  String encode(dynamic object) => jsonx.encode(object);
  
  dynamic decode(String text, Type type) => jsonx.decode(text, type: type);
}

