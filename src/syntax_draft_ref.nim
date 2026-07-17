#[ This is a multi line comment
    <comment>
    #[
      Nested comment.
    ]#
]#

import std/strformat
from std/strutils import parseInt

echo "***** Syntax draft reference *****" # This is a one-line comment

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
echo "\n*** 'if' and 'case' statements ***"
echo "\nInsert your name: "
var name: string = readLine(stdin)
echo "and your surname: "
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
echo "\nraw string -->", r" C:\program files\nim"
echo "\n"

var one_million = 1_000_000
var float_point_literal = 1.0e9 # (one billion)
var hexadecimal_literal = 0x1A # (26 in decimal)
var binary_literal = 0b1010 # (10 in decimal)
var octal_literal = 0o755 # (493 in decimal)
echo fmt"""one_million={one_million},
  float_point_literal={float_point_literal},
  hexadecimal_literal={hexadecimal_literal},
  binary_literal={binary_literal},
  octal_literal={octal_literal}"""


echo "\nCase values range with else clause "
echo "A number please: "
let n = parseInt(readLine(stdin))
case n
of 0..2, 4..7: echo "The number is in the set: {0, 1, 2, 4, 5, 6, 7}"
of 3, 8: echo "The number is 3 or 8"
else: echo "The number is not in the range of 0-8"

echo "\n*** Control Flow Statements ***"
echo "\nWhile loop"
echo "\nSpelling letters in your name:"
var i = 0
while i <= len(name)-1:
  echo fmt"{name[i]}"
  i += 1

echo "\nFor loop"
echo "\nCounting from 1 to 5:"
for i in 1..5:
  echo i

echo "\nCounting down from 5 to 1: "
for i in countdown(5, 1):
  echo i

echo "\nHigh index shorcut '..<': "
for i in 0 ..< surname.len:
  echo fmt"Letter {i+1} in your surname is: {surname[i]}"

echo "\nBackward index operator '..<': "
for idx, c in surname[0 .. ^1]:
  echo fmt"Letter {idx+1} in your surname is: {c}"

echo "\nitems and pairs in a sequence:"
for index, item in ["x","y", "z"].pairs:
  echo item, " at index ", index

echo "\n *** Block statement (new scope) ***"
echo "\nblock:"
block myblock:
  var a = "block variable"
  echo fmt"Inside block: a={a}"
echo fmt"Outside block: a={a}"

echo "\nbreak:"
block myblock:
  echo "into block 1 (loop break)"
  while true:
    echo "looping"
    break # leaves the loop, but not the block
  echo "loop exited but still in block 1"
echo "outside block 1"

block myblock2:
  echo "\ninto block 2 (block break)"
  while true:
    echo "looping"
    break myblock2 # leaves the block (and the loop)
  echo "still in block 2" # it won't be printed
echo "outside block 2"
