library resolution;

// Resolution is the result of dependency resolution: either a successfully
// resolved target or an error.
class Resolution {
  // Raw is the original raw dep that this was resolution was attempted on.
  String raw;

  // Target is the resolved dependency, if resolution succeeds.
  String target;

  // Error is the resolution error, if any.
  String error;
}