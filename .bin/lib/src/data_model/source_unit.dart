library source_unit;

class SourceUnit {
  // Name is an opaque identifier for this source unit that MUST be unique
  // among all other source units of the same type in the same repository.
  //
  // Two source units of different types in a repository may have the same name.
  // To obtain an identifier for a source unit that is guaranteed to be unique
  // repository-wide, use the ID method.
  String name;

  // Type is the type of source unit this represents, such as "GoPackage".
  String type;

  // Repo is the URI of the repository containing this source unit, if any.
  // The scanner tool does not need to set this field - it can be left blank,
  // to be filled in by the `src` tool
  Uri repo;

  // Globs is a list of patterns that match files that make up this source
  // unit. It is used to detect when the source unit definition is out of date
  // (e.g., when a file matches the glob but is not in the Files list).
  //
  // TODO(sqs): implement this in the Makefiles
  List<String> globs;

  // Files is all of the files that make up this source unit.
  List<String> files;

  // Dir is the root directory of this source unit. It is optional and maybe
  // empty.
  String dir;

  // Dependencies is a list of dependencies that this source unit has. The
  // schema for these dependencies is internal to the scanner that produced
  // this source unit. The dependency resolver is expected to know how to
  // interpret this schema.
  //
  // The dependency information stored in this field should be able to be very
  // quickly determined by the scanner. The scanner should not perform any
  // dependency resolution on these entries. This is because the scanner is
  // run frequently and should execute very quickly, and dependency resolution
  // is often slow (requiring network access, etc.).
  List<String> dependencies;

  // Info is an optional field that contains additional information used to
  // display the source unit
  Map info;

  // Data is additional data dumped by the scanner about this source unit. It
  // typically holds information that the scanner wants to make available to
  // other components in the toolchain (grapher, dep resolver, etc.).
  List<String> data;

  // Config is an arbitrary key-value property map. The Config map from the
  // tree config is copied verbatim to each source unit. It can be used to
  // pass options from the Srcfile to tools.
  Map<String, String> config;

  // Ops enumerates the operations that should be performed on this source
  // unit. Each key is the name of an operation, and the value is the tool to
  // use to perform that operation. If the value is nil, the tool is chosen
  // automatically according to the user's configuration.
  Map<String, String> ops;  
}
