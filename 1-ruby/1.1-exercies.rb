puts "Guess a number! from 1 to 10"

number = rand(10)
attempts = 0
x = gets.to_i

range_error = "wtf! its not even in range 1..10"

loop do
  puts "You entered: #{x}"
  puts "..."
  break if number == x
  puts "Wrong!"
  puts range_error if x < 1 or x > 10
  puts "Try again"
  x = gets.to_i
  attempts += 1
end

puts "And You guessed it!"
puts "Total attempts used: #{attempts}"