properties = ["object oriented", "dynamic", "productive", "fun"]

properties.each {|prop| puts "Ruby is #{prop}"}


# Everything is object
4.class
5.methods

puts false.class
puts true.class

# Conditional
x = 4

puts "this is false" unless x == 4 
puts "this is true" if x == 4

if x == 4
  puts "this is true"
end

unless x == 4
  puts "this is false"
else
  puts "this is true"
end

puts "this is true" if not true
puts "this is true" if !true

# While loop

x = x + 1 while x < 10
puts "x: #{x}"
x = x - 1 until x == 1
puts "x: #{x}"

while x < 10
  x = x + 1
  puts x
end

# Implicit boolean
puts "this is true" if 1

puts "0 is truthy" if 0
puts "nil is falsy" if nil

# Logical operators

true and false
false or true

true && false
true || false

true or error

def add_them_up
  4 + 'four'
end

