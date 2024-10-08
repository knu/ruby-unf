## 0.2.0 (2024-08-18)

Features:

  - Use String#unicode_normalize on Ruby >=2.2 unless unf_ext is already loaded.

  - Reduce the gem size by removing unnecessary files. (GH #22)

## 0.1.4 (2014-04-04)

Bugfixes:

  - Fix the gem platform name for JRuby.

## 0.1.3 (2013-10-25)

Features:

  - Make UNF::Normalizer.instance thread-safe, and deprecate .new.
    (GH #6)

## 0.1.2 (2013-08-12)

Features:

  - Add license to gemspec.

  - Adjust dependencies for Ruby 1.8 to satisfy bundler.

## 0.1.1 (2013-03-23)

Features:

  - Add rdoc.

## 0.1.0 (2013-03-18)

Features:

  - Start CI with Travis-CI.

## 0.0.5 (2012-03-04)

Features:

  - Migrate from Jeweler to Bundle gem.

Bugfixes:

  - Fix gem support for JRuby.

## 0.0.4 (2011-12-09)

Features:

  - Introduce autoloading.

## 0.0.3 (2011-10-25)

  - Initial release.
