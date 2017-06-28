run `elm-test --report=json | node report-duration.js`

```
list (list int)                   => 109
list (list string)                => 5852
list int                          => 2
list string                       => 193
shortList (shortList int)         => 1
shortList (shortList shortString) => 3
shortList int                     => 0
shortList shortString             => 1
```
