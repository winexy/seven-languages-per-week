number := 42
attempts := 0

while (attempts < 10,
  guess := File standardInput readLine("Guess a number: ") asNumber()
  attempts = attempts + 1

  if (guess == number) then (
    ":: -------------- ::" println
    ":: You got it!!!" println
    ":: Total attempts #{attempts}" interpolate println
    ":: -------------- ::" println
    break
  ) elseif (guess > number) then (
    "> Just a little big bigger, try again" println
  ) else (
    "> Too small number, try again" println
  )

)

if (attempts >= 10) then(
  ":: Sorry, you've no attempts" println
)