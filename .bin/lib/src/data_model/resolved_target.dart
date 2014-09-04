library resolved_target;

import "package:srclib_dart/src/srclib_encoder.dart" show jsonObject, 
                                                          jsonProperty;

// ResolvedTarget represents a resolved dependency target.
@jsonObject
class ResolvedTarget {
  // ToRepoCloneURL is the clone URL of the repository that is depended on.
  //
  // When graphers emit ResolvedDependencies, they should fill in this field,
  // not ToRepo, so that the dependent repository can be added if it doesn't
  // exist. The ToRepo URI alone does not specify enough information to add
  // the repository (because it doesn't specify the VCS type, scheme, etc.).
  @jsonProperty String toRepoCloneURL;

  // ToUnit is the name of the source unit that is depended on.
  @jsonProperty String toUnit;

  // ToUnitType is the type of the source unit that is depended on.
  @jsonProperty String toUnitType;

  // ToVersion is the version of the dependent repository (if known),
  // according to whatever version string specifier is used by FromRepo's
  // dependency management system.
  @jsonProperty String toVersionString;

  // ToRevSpec specifies the desired VCS revision of the dependent repository
  // (if known).
  @jsonProperty String toRevSpec;
}
