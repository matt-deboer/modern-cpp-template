modern-cpp-template
===

A modern c++ template, cribbed heavily from https://github.com/LearningByExample/ModernCppCI.

[x] Added [cotire](https://github.com/sakra/cotire) for build speedup
[x] Added `make` wrapper to simplify commands
[x] Added [Clara](https://github.com/catchorg/Clara) for command line parsing

Add a third-party dependency from git:

- Run `make git-dependency URL=${GIT_URL} COMMIT=${TAG_OR_COMMIT}`
- Update `third_party/CMakeLists.txt` to reference your new dependency


Build
---

- Run `make build`

