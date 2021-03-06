
# The documentation below is out-of-date by one version. I will update these soon.

# Install one of the adapter packages

* [mucheck-quickcheck](https://bitbucket.org/osu-testing/mucheck-quickcheck)
* [mucheck-smallcheck](https://bitbucket.org/osu-testing/mucheck-smallcheck)
* [mucheck-hunit](https://bitbucket.org/osu-testing/mucheck-hunit)
* [mucheck-hspec](https://bitbucket.org/osu-testing/mucheck-hspec)

# Execute the adapter help
```
$ $dist/mucheck-quickcheck -h
$ $dist/mucheck-smallcheck -h
$ $dist/mucheck-hunit -h
$ $dist/mucheck-hspec -h
```
Use the example given.
## QuickCheck
```
$ ./mucheck-quickcheck Examples/QuickCheckTest.hs 'quickCheckResult idEmpProp' 'quickCheckResult revProp' 'quickCheckResult modelProp'
```

# Or use it from ghci as a library, after copying one of the examples like this.
## QuickCheck
```
$ cp ../mucheck-quickcheck/Examples/QuickCheckTest.hs Examples/QuickCheckTest.hs
$ ghci
> :m + Test.MuCheck
> :m + Test.MuCheck.TestAdapter
> :m + Test.MuCheck.TestAdapter.QuickCheck
> :m + Test.QuickCheck.Test
> mucheck (testSummary::[Mutant] -> [InterpreterOutput QuickCheckSummary] -> Summary) "Examples/QuickCheckTest.hs" ["quickCheckResult idEmpProp","quickCheckResult revProp","quickCheckResult modelProp"]
```
## SmallCheck
```
$ cp ../mucheck-smallcheck/Examples/SmallCheckTest.hs Examples/SmallCheckTest.hs
$ ghci
> :m + Test.MuCheck
> :m + Test.MuCheck.TestAdapter
> :m + Test.MuCheck.TestAdapter.SmallCheck
> :m + Test.SmallCheck
> mucheck (testSummary::[Mutant] -> [InterpreterOutput SmallCheckSummary] -> Summary) "Examples/SmallCheckTest.hs" ["smallCheckResult idEmpProp"]
```

## HUnit
```
$ cp ../mucheck-hunit/Examples/HUnitTest.hs Examples/HUnitTest.hs
$ ghci
> :m + Test.MuCheck
> :m + Test.MuCheck.TestAdapter
> :m + Test.MuCheck.TestAdapter.HUnit
> :m + Test.HUnit
> mucheck (testSummary::[Mutant] -> [InterpreterOutput HUnitSummary] -> Summary) "Examples/HUnitTest.hs" ["runTestTT tests"]
```

## Hspec
```
$ cp ../mucheck-hspec/Examples/HspecTest.hs Examples/HspecTest.hs
$ ghci
> :m + Test.MuCheck
> :m + Test.MuCheck.TestAdapter
> :m + Test.MuCheck.TestAdapter.Hspec
> :m + Test.Hspec.Core.Runner
> mucheck (testSummary::[Mutant] -> [InterpreterOutput HspecSummary] -> Summary) "Examples/HspecTest.hs" ["spec"]
```

# Distributed mutation analysis
See [d-mucheck](https://bitbucket.org/osu-testing/d-mucheck) for distributed mutation analysis wrapper over mucheck
