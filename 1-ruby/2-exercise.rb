# реализуйте вывод массива, содержащего 16 чисел, по четыре
# числа сразу, только с помощью метода each. А затем реализуйте
# то же самое с помощью метода each_slice из модуля Enumerable;

xs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

class Array
  def each_slice(slice_size, &block)
    i = 0
    while i < slice_size
      shift = i * slice_size
      chunk = self[shift..shift + slice_size - 1]
      if chunk != nil
        block.call chunk
      end
      i += 1
    end
  end
end


xs.each_slice(5) {|chunk| puts chunk.join '-'}


=begin
класс Tree получился довольно интересным, 
но он не позволяет создавать деревья с более очевидной структурой.
Добавьте в метод инициализации поддержку вложенных структур дан-ных 
в виде хэшей и массивов. То есть должна поддерживаться
возможность инициализировать дерево, как: 
{ 
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    }, 
    'uncle' => {
      'child 3' => {}, 
      'child 4' => {}
    }
  } 
};
=end

class Tree
  attr_accessor :value, :children

  def initialize(value, children=[])
    if value.class == Hash
      from_tree(value)
    else
      @value = value
      @children = children
    end
  end

  def from_tree(tree)
    if tree.length > 1
      raise "Tree should have only one root value but there are #{tree.length} keys found. [#{tree.keys.join ', '}]" 
    end

    @value = tree.keys[0]
    @children = tree[@value].entries.map do |key, value|
      Tree.new({ key => value }) 
    end
  end

  def visit(&block)
    _visit(block)
  end

  def _visit(block, depth=0)
    block.call @value, depth
    @children.each {|c| c._visit(block, depth + 1) }
  end
end
  

tree = Tree.new({
  'grandpa' => {
    'dad' => {
      'child 1' => {
        'subchild 1' => {}
      },
      'child 2' => {}
    }, 
    'uncle' => {
      'child 3' => {}, 
      'child 4' => {}
    }
  },
})

tree.visit { |value, depth| puts "#{' ' * depth}#{value}" }