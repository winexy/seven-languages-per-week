matrix := list(
  list(1, 2, 3, 4),
  list(5, 6, 7, 8),
  list(9, 10, 11, 12)
)

matrixSum := method(
  matrix,
  m := matrix size
  n := matrix at(0) size
  sum := 0
  for(i, 0, m - 1, 
    for(j, 0, n - 1,
      sum := sum + matrix at(i) at(j)
    )
  )
  sum
)

matrixSum(matrix) println