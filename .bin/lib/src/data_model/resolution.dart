library resolution;

import "package:srclib_dart/src/srclib_encoder.dart" show jsonObject, 
                                                          jsonProperty;


// Resolution is the result of dependency resolution: either a successfully
// resolved target or an error.
@jsonObject
class Resolution {
  // Raw is the original raw dep that this was resolution was attempted on.
  @jsonProperty String raw;

  // Target is the resolved dependency, if resolution succeeds.
  @jsonProperty String target;

  // Error is the resolution error, if any.
  @jsonProperty String error;
}
