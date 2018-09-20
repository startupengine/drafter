#!/bin/bash

set -e

function report_error () {
  echo "There are some style issues. Please run clang-format on your files."
  exit 1;
}

clang-format -style=file -output-replacements-xml $(git ls-files snowcrash markdown-parser drafter | grep -e '\.cc$\|\.h$' | grep -v 'ext/') | awk '/\<replacement /{exit 1}' || report_error
