# Array
xs = [1, 2, 3, 4, 5]

puts xs[0..2].join '::'
puts xs[-1]
puts xs[0]

# Hash

numbers = {
  1 => 'one',
  2 => 'two'
}

puts numbers

# Symbolic name :symbol
types = {
  :array => 'array',
  :string => 'string'
}

puts types
puts types[:string]

def tell_the_truth(options={})
  if options[:profession] == :lawyer
    'it could be believed that this is almost certainly not false'
  else
    true
  end
end

puts tell_the_truth :profession => :lawyer
puts tell_the_truth ({ 'a' => 1, 'c' => 2 })
puts tell_the_truth

# Blocks

3.times { puts 'hiya there, kiddo' }

5.times do |x|
  puts "hello #{x + 1}"
end

class Integer
  def kek
    puts "kek #{self}"
    yield
  end
end

4.kek { puts "done!" }

def print4(&block)
  block.call 4
end

print4 { |x| puts x }

# Class

class Tree
  attr_accessor :children, :name, :test

  def initialize(name, children=[])
    @name = name
    @children = children
  end

  def visit(&block)
    block.call self
    @children.each { |c| c.visit &block }
  end
end

tree = Tree.new("One", [
  Tree.new("Two"),
  Tree.new("Three")
])

tree.visit do |node| 
  puts "Visiting: #{node.name}"
end

### module

module ToFile
  def file_name
    "object_#{self.object_id}.txt"
  end

  def write
    File.open(file_name, 'w') {|f| f.write(get_file_content)}
  end
end

class Person
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_file_content
    name
  end
end

Person.new('olzhas').write

# Compare

puts 'begin' <=> 'end'