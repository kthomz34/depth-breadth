class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

  def find_node(node, value)
    if node.payload == value
      return node
    elsif node.children == []
      return false
    else node.children.each do |child_node|
      result = find_node(child_node, value)
      #return the result only if it is true
      return result if result
    end
    return false
  end
end


# The "Leafs" of a tree, elements that have no children
fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

result = find_node(trunk, 4)

puts result.inspect
