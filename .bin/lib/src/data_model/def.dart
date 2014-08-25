library def;

class Def {
  // SID is a unique, sequential ID for a def. It is regenerated each time
  // the def is emitted by the grapher and saved to the database. The SID
  // is used as an optimization (e.g., joins are faster on SID than on
  // DefKey).
  int SID;

  // DefKey is the natural unique key for a def. It is stable
  // (subsequent runs of a grapher will emit the same defs with the same
  // DefKeys).
  // DefKey

  // TreePath is a structurally significant path descriptor for a def. For
  // many languages, it may be identical or similar to DefKey.Path.
  // However, it has the following constraints, which allow it to define a
  // def tree.
  //
  // A tree-path is a chain of '/'-delimited components. A component is either a
  // def name or a ghost component.
  // - A def name satifies the regex [^/-][^/]*
  // - A ghost component satisfies the regex -[^/]*
  // Any prefix of a tree-path that terminates in a def name must be a valid
  // tree-path for some def.
  // The following regex captures the children of a tree-path X: X(/-[^/]*)*(/[^/-][^/]*)
  //TreePath TreePath `db:"treepath" json:",omitempty"`
  String treePath; // TODO: could make this a structured type.

  // Kind is the language-independent kind of this def.
  String kind;

  String name;

  // Callable is true if this def may be called or invoked, such as in the
  // case of functions or methods.
  bool callable;

  String file;

  int defStart;
  int defEnd;

  bool exported;

  // Test is whether this def is defined in test code (as opposed to main
  // code). For example, definitions in Go *_test.go files have Test = true.
  bool test;

  // Data contains additional language- and toolchain-specific information
  // about the def. Data is used to construct function signatures,
  // import/require statements, language-specific type descriptions, etc.
  String data; // TODO: Could be a map or dynamic
}