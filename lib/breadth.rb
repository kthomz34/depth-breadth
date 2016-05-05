class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

def find_node(node, value)
  find_queue = Queue.new

  while !node.nil?
    if node.payload == value
      return node

    else
      unless node.children.empty?
        # enqueue all the child nodes so we can get them later
        node.children.each { |child| find_queue.enqueue(child) }
      end
    end
    # get the oldest node still in the queue
    node = find_queue.dequeue
  end
  return nil
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
