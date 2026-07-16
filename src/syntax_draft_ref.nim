#[ This is a multi line comment
    <comment>
    #[
      Nested comment.
    ]#
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

# Read input
echo fmt"Insert your name: "
var name: string = readLine(stdin)
echo fmt"and your surname: "
var surname: string = readLine(stdin)

if name == "" and surname == "":
  echo "Poor soul, you lost your name?"
elif name == "name" or surname == "surname":
  echo "Very funny, your name is name or your surname is surname."
else:
  echo fmt"Hello, {name} {surname}!"

case name
of "Dave", "Frank":
  echo "Cool name!"
else:
  echo "Already greeted!"

# raw literal
echo "raw string -->", r" C:\program files\nim"

var one_million = 1_000_000
var float_point_literal = 1.0e9 # (one billion)
var hexadecimal_literal = 0x1A # (26 in decimal)
var binary_literal = 0b1010 # (10 in decimal)
var octal_literal = 0o755 # (493 in decimal)
echo fmt"one_million={one_million}, float_point_literal={float_point_literal}, hexadecimal_literal={hexadecimal_literal}, binary_literal={binary_literal}, octal_literal={octal_literal}"