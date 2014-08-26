

## Basic checkout and run test command

```
git clone https://github.com/financeCoding/srclib-dart.git
git pull && git submodule init && git submodule update && git submodule status
#src test --gen --methods program
src test --methods program
```

## Executing scan, graph, depresolve, info

The `src` tool does not support printing fully to standard out for the failed parser. 

```
–(~/dart/srclib-dart)–($ /Users/adam/.srclib/github.com/financeCoding/srclib-dart/.bin/srclib-dart scan --repo github.com/financeCoding/twitter-text-dart --subdir /Users/adam/dart/srclib-dart/testdata/case/twitter-text-dart/
```
