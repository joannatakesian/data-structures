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
            if queue[0].value == value
                return queue[0]
            end
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
            if current.value == value
                return current
            end
            stack.shift
            stack.unshift(current.right) if current.right != nil
            stack.unshift(current.left) if current.left != nil
        end
        return nil
    end
    
    def dfs_rec(value, node = @root)
        if node.value == value
            return node
        end
        dfs_rec(value, node.left) if node.left != nil
        dfs_rec(value, node.right) if node.right != nil
    end
end