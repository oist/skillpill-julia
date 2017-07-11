#-------------binary_trees.jl--------------------------------------------------#
#
# Purpose: This implements a basica binary tree, DFS, and a Priority Queue
#
#------------------------------------------------------------------------------#

# First, we need to create a type for empty nodes
type Empty
end

et = Empty()

# Now we need a typealias for the tree
typealias BT{T} Union{T,Empty}

# Type of Binary Tree
type BTree
    weight::Float64
    bitpath::String
    left::BT{BTree}
    right::BT{BTree}
end

# Depth-First Search
function DFS(node::BTree)
    println(node.bitpath)
    if (node.right != et)
        #println(0)
        DFS(node.right)
    end
    
    if (node.left) != et
        #println(1)
        DFS(node.left)
    end

    if (node.left == et && node.right == et)
        println(node.bitpath)
    end
end

# Function to create binary tree with a certain number of generations
function create_BTree(node::BT, gen::Int64, max_gen::Int64, bitpath::String)

    node.weight = rand()
    node.bitpath = bitpath

    if gen < max_gen
        node.right = BTree(0, "", et, et)
        node.left = BTree(0, "", et, et)
        create_BTree(node.right, gen+1, max_gen, string(bitpath,1))
        create_BTree(node.left, gen+1, max_gen, string(bitpath,0))
    end
    
end

function main()

    tree = BTree(0, "", et, et,)
    create_BTree(tree, 0, 3, "")
    DFS(tree)
    
end

main()
