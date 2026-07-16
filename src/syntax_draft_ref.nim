#[ This is a multi line comment
    <comment>
]#

import std/strformat

echo "Syntax draft reference" # This is a one-line comment

proc getAlphabet(): string =
  for letter in 'a'..'z':
    result.add(letter)

# Computed at compilation time
const alphabet = getAlphabet()

# Incorrect result use
proc unexpected(): int =
  var result = 5
  result += 5

echo unexpected() 

# Mutable variables
var
  a = "foo"
  b = 0
  # Works fine, initialized to 0
  c: int

# Immutable variables
let
  d = "foo"
  e = 5
  # Compile-time error, must be initialized at creation --> f: float
  f = 5.35

# Works fine, vars are mutable
a.add("bar")
b += 1
c = 3

echo fmt"a={a}, b={b}, c={c}, d={d}, e={e}, f={f}, alphabet={alphabet}"
# Compile-time error, const cannot be modified at run-time --> alphabet = "abc"

# Compile-time error, `d` and `e` are immutable --> d.add("bar"), e += 1
