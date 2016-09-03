class Node
    attr_accessor :value, :parent, :left, :right
    
    def initialize(value=nil, parent=nil, left=nil, right=nil)
        @value = value
        @parent = parent
        @left = left
        @right = right
    end
end

class Tree
    def initialize(root = nil)
        @root = Node.new(root)
    end

    def build(array)
        array.each do |element|
            index = @root
            add_node(element, index)
        end
    end

    def add_node(value, index)
        if value < index.value
            if index.left == nil
                index.left = Node.new(value, index)
                puts "Node with value #{value} added as left child of #{index.value}."
            else
                add_node(value, index.left)
            end
        elsif value > index.value
            if index.right == nil
                index.right = Node.new(value, index)
                puts "Node with value #{value} added as right child of #{index.value}."
            else
                add_node(value, index.right)
            end
        else
            # element exists in binary tree
            puts "Element #{value} exists in binary tree as #{index.value}."
        end
    end
    
    def breadth_first_search(value); end
    
    def depth_first_search(value); end
    
    def dfs_rec(value); end
end


array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(array[0])
tree.build(array)
tree.breadth_first_search(23)
tree.depth_first_search(23)
tree.dfs_rec(23)