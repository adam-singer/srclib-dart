library doc;

import "package:srclib_dart/src/srclib_encoder.dart" show jsonObject, 
                                                          jsonProperty;

// Docstring
@jsonObject
class Doc {
  // A link to the definition that this docstring describes
  // DefKey

  // The MIME-type that the documentation is stored in. Valid formats include 'text/html', 'text/plain', 'text/x-markdown', text/x-rst'
  @jsonProperty String format;

  // The actual documentation text
  @jsonProperty String data;

  // Location where the docstring was extracted from. Leave blank for undefined location
  @jsonProperty String file;
  @jsonProperty int start;
  @jsonProperty int end;
}
