
origDivOperator := Number getSlot("/")
Number / := method(
  divisor, 
  (divisor == 0) ifTrue(
    return 0) ifFalse(
    return self origDivOperator(divisor))
)

(4 / 0) println
(4 / 2) println
(16 / 4) println