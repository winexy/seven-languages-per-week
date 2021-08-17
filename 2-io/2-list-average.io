List myAverage := method(
  if(self isEmpty) then(return 0)
  sum := 0
  self foreach(x, 
    (x isKindOf(Number)) ifFalse(
      Exception raise("\"#{x}\" is not a Number" interpolate)
    )
    sum := sum + x
  )
  sum / self size
)

list(1, 2, 3, 4, 5) myAverage println

list(1, 2, "hello", 3, 4, 5) myAverage println