library doc;

// Docstring
class Doc {
  // A link to the definition that this docstring describes
  // DefKey

  // The MIME-type that the documentation is stored in. Valid formats include 'text/html', 'text/plain', 'text/x-markdown', text/x-rst'
  String format;

  // The actual documentation text
  String data;

  // Location where the docstring was extracted from. Leave blank for undefined location
  String file;
  int start;
  int end;
}
