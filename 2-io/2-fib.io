fib := method(
  number,
  a := 1
  b := 1
  (number <= 0) ifTrue(Exception raise("argument is less than 1"))
  (number <= 2) ifTrue(return a)
  for(i, 3, number, prev := a; a := b; b := prev + b)
  return b
)

"iterative" println
list(1, 2, 3, 4, 5, 6, 7, 8) map(x, fib(x)) join(" ") println

fibR := method(
  number,
  (number <= 0) ifTrue(return 0)
  (number <= 2) ifTrue(return 1)
  return fibR(number - 2) + fibR(number - 1)
)

"recursive" println
list(1, 2, 3, 4, 5, 6, 7, 8) map(x, fibR(x)) join(" ") println