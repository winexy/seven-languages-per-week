Matrix := Object clone

Matrix box := list(
  list(1, 2, 3),
  list(4, 5, 6)
)

Matrix get := method(x, y, self box at(x) at(y))

Matrix set := method(x, y, value, 
  newBox := box clone
  row := self box at(x) clone
  newRow := row atPut(y, value)
  newBox atPut(x, newRow)
  self box = newBox
)

Matrix toFile := method(fileName,
  File with(fileName) open write(self box serialized) close
)

Matrix fromFile := method(fileName,
  matrix := Matrix clone
  matrix box = doRelativeFile(fileName)
  matrix
)

dim := method(x, y,
  matrix := Matrix clone 
  matrix box := list() setSize(y) map(
    list() setSize(x) map(0)
  )
  matrix
)

matrix := dim(3, 2)

matrix get(0, 2) println // 3

matrix box println // list(list(1, 2, 3), list(4, 5, 6))
matrix set(0, 2, 10) println // list(list(1, 2, 10), list(4, 5, 6))
matrix box println  // list(list(1, 2, 10), list(4, 5, 6))
matrix get(0, 2) println // 10

Matrix box println // list(list(1, 2, 3), list(4, 5, 6))

matrix toFile("matrix.txt")
newMatrix := Matrix fromFile("matrix.txt")

newMatrix box println
