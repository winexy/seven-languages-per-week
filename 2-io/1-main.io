"hello world" println

Vehicle := Object clone
Vehicle description := "Vehicle Description"

Car := Vehicle clone

ferrari := Car clone
ferrari proto proto slotNames contains("description") println

add := method(a, b, a + b)
eq := method(a, b, a == b)
is_100_500 := method(a, eq(a, 100500))

success := method("a + b is 100500" println)

main := method(
  a := 100000
  b := 500
  sum := add(a, b)
  if(is_100_500(sum)) then(success) 
)

main