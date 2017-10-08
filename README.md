# quality

Quality checks for gradle-based applications (pure Java and Android).

Includes:

* Java lint ([checkstyle](http://checkstyle.sourceforge.net),
  [pmd](https://pmd.github.io), [findbugs](http://findbugs.sourceforge.net))
  configs and tasks

* [Android lint](https://developer.android.com/studio/write/lint.html) config

* [KtLint](https://github.com/shyiko/ktlint)

* [error-prone](https://github.com/google/error-prone) compiler setup

Bonus:

* prints all errors in human-readable and at the same time machine-parseable
  format of `<filename>:<line>: <check name>: <error message>`, allowing to pipe
  the output into most editors and IDEs error windows

* `resolveDependencies` task that will pre-download all dependencies for all
  configurations (useful for caching in CI)

Meta tasks:

* Android: `checkQuality<variant name>` (e.g. `checkQualityDebug`)

* Java: `checkQuality<source set name>` (e.g. `checkQualityMain`)

Based on:

* various external configurations and style guides

* some existing plugins (e.g.
  [findbugs-android](https://github.com/ChaitanyaPramod/findbugs-android))

* [Google Java style guide](https://google.github.io/styleguide/javaguide.html)

* [FirebaseUI-Android](
https://github.com/firebase/FirebaseUI-Android/tree/master/library/quality)
project quality checks configuration

* trial and error
