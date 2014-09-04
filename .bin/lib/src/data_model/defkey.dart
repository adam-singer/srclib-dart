library defkey;

import "package:srclib_dart/src/srclib_encoder.dart" show jsonObject, 
                                                          jsonProperty;

// DefKey specifies a definition, either concretely or abstractly. A concrete
// definition key has a non-empty CommitID and refers to a definition defined in a
// specific commit. An abstract definition key has an empty CommitID and is
// considered to refer to definitions from any number of commits (so long as the
// Repo, UnitType, Unit, and Path match).
//
// You can think of CommitID as the time dimension. With an empty CommitID, you
// are referring to a definition that may or may not exist at various times. With a
// non-empty CommitID, you are referring to a specific definition of a definition at
// the time specified by the CommitID.
@jsonObject
class Defkey {
  // Repo is the VCS repository that defines this definition. Its Elasticsearch mapping is defined
  // separately.
  Uri repo;

  // CommitID is the ID of the VCS commit that this definition was defined in. The
  // CommitID is always a full commit ID (40 hexadecimal characters for git
  // and hg), never a branch or tag name.
  String commitID;

  // UnitType is the type name of the source unit (obtained from unit.Type(u))
  // that this definition was defined in.
  @jsonProperty String unitType;

  // Unit is the name of the source unit (obtained from u.Name()) that this
  // definition was defined in.
  @jsonProperty String unit;

  // Path is a unique identifier for the def, relative to the source unit.
  // It should remain stable across commits as long as the def is the
  // "same" def. Its Elasticsearch mapping is defined separately (because
  // it is a multi_field, which the struct tag can't currently represent).
  //
  // Path encodes no structural semantics. Its only meaning is to be a stable
  // unique identifier within a given source unit. In many languages, it is
  // convenient to use the namespace hierarchy (with some modifications) as
  // the Path, but this may not always be the case. I.e., don't rely on Path
  // to find parents or children or any other structural propreties of the
  // def hierarchy). See Def.TreePath instead.
  @jsonProperty String defPath;
}
