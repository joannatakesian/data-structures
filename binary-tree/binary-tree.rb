class Node
    attr_accessor :value, :parent, :left, :right
    
    def initialize(value=nil, left=nil, right=nil)
        @value = value
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
            else
                add_node(value, index.left)
            end
        elsif value > index.value
            if index.right == nil
                index.right = Node.new(value, index)
            else
                add_node(value, index.right)
            end
        end
    end
    
    def breadth_first_search(value)
        queue = [@root]
        
        until queue.empty? do
            return queue[0] if queue[0].value == value
            queue << queue[0].left if queue[0].left != nil
            queue << queue[0].right if queue[0].right != nil
            queue.shift
        end
        return nil
    end
    
    def depth_first_search(value)
        stack = [@root]
        
        until stack.empty? do
            current = stack[0]
            return current if current.value == value
            stack.shift
            stack.unshift(current.right) if current.right != nil
            stack.unshift(current.left) if current.left != nil
        end
        return nil
    end
    
    def dfs_rec(value, node = @root)
        return node if node.value == value
        dfs_rec(value, node.left) if node.left != nil
        dfs_rec(value, node.right) if node.right != nil
    end
end