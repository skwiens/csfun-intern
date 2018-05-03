require_relative 'binary_node.rb'

class Binary_Seach_Tree

  def initialize
    @root = nil
  end

  def count_recursive(current=@root, num_nodes=0)

    if current == nil
      return num_nodes
    else
      num_nodes += 1
    end

    if current
      num_nodes = count(current.left, num_nodes)
      num_nodes = count(current.right, num_nodes)
    end
    return num_nodes
  end

  def count_iterative
    if @root == 0
      return 0
    else
      count = 1
      queue = []
      queue.unshift(@root)
    end

    while queue.length > 0
      node = queue.pop

      if node.left
        count += 1
        queue.push(node.left)
      end

      if node.right
        count += 1
        queue.push(node.right)
      end
    end

    return count
  end


  def add(value)
    newNode = Binary_Node.new(value)

    if !@root
      @root = newNode
    else
      # add_recursive(@root, value)
      add_iterative(@root, value)
    end
  end

  def add_recursive(current, value)
    if value < current.value
      if current.left == nil
        current.left = Binary_Node.new(value)
      else
        add_recursive(current.left, value)
      end
    else value >= current.value
      if current.right == nil
        current.right = Binary_Node.new(value)
      else
        add_recursive(current.right, value)
      end
    end
  end #end of add_recursive

  def add_iterative(current, value)
    parent = current
    while current != nil
      parent = current
      if value < current.value
        current = current.left
      else
        current = current.right
      end
    end

    if value < parent.value
      parent.left = Binary_Node.new(value)
    else
      parent.right = Binary_Node.new(value)
    end
  end

  def search(value)
    current = @root
    while current
      if current.value < value
        current = current.left
      elsif current.value > value
        current = current.right
      else
        return true
      end
    end
    return false
  end

  def delete(value)
    current = @root

    if current == nil
      return false
    end

    if value < current.value
      current = current.left
    elsif value > current.value
      current = current.right
    else
      delete_node(current)
    end
  end

  private

  def delete_node(node)
    if node.left == nil && node.right == nil
      current = nil
    if node.
  end

end #end of class

my_tree = Binary_Seach_Tree.new
my_tree.add(3)
my_tree.add(7)
my_tree.add(2)
my_tree.add(3)

puts my_tree.count_iterative
