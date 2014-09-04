library ref;

import "package:srclib_dart/src/srclib_encoder.dart" show jsonObject, 
                                                          jsonProperty;


// Ref represents a reference from source code to a def.
@jsonObject
class Ref {
  // The definition that this reference points to
  @jsonProperty String defRepo;
  @jsonProperty String defUnitType;
  @jsonProperty String defUnit;
  @jsonProperty String defPath;

  // Def is true if this ref is the original definition or a redefinition
  @jsonProperty bool def;

  @jsonProperty String repo;

  // CommitID is the immutable commit ID (not the branch name) of the VCS
  // revision that this ref was found in.
  @jsonProperty String commitID;

  @jsonProperty String unitType;
  @jsonProperty String unit;

  @jsonProperty String file;
  @jsonProperty int start;
  @jsonProperty int end;
}
