library output;

import "package:srclib_dart/src/srclib_encoder.dart" show jsonObject, 
                                                          jsonProperty;

import "def.dart";
import "ref.dart";
import "doc.dart";

// Output is produced by grapher tools.
@jsonObject
class Output {
  @jsonProperty List<Def> defs;
  @jsonProperty List<Ref> refs;
  @jsonProperty List<Doc> docs;
}
