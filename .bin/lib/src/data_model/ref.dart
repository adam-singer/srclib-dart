library ref;

// Ref represents a reference from source code to a def.
class Ref {
  // The definition that this reference points to
  Uri defRepo;
  String defUnitType;
  String defUnit;
  String defPath;

  // Def is true if this ref is the original definition or a redefinition
  bool def;

  Uri repo;

  // CommitID is the immutable commit ID (not the branch name) of the VCS
  // revision that this ref was found in.
  String commitID;

  String unitType;
  String unit;

  String file;
  int start;
  int end;
}