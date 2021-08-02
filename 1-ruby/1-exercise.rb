# Substitution

s = 'hello, world'
s.sub! 'world', 'there!'

puts s

# Regex

puts /^hello/.match s
puts "it matches!" if /^hello/.match? s

# Range

puts ('a'..'e').to_a.join " "
puts (1..5).to_a.join " "

# Index

seven = "Hello, Ruby".index "Ruby"

# Print name

for i in 0..10
  puts "#{i}::olzhas"
end
