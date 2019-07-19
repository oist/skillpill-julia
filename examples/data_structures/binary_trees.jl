#-------------binary_trees.jl--------------------------------------------------#
#
# Purpose: This implements a basica binary tree, DFS, and a Priority Queue
#
#------------------------------------------------------------------------------#

# Now we need a typealias for the tree
abstract type BT end

# Type of Binary Tree
type BTree <: BT
    weight::Float64
    bitpath::String
    left::BT
    right::BT
end

# First, we need to create a type for empty nodes
type Empty <: BT end
const et = Empty()

# Depth-First Search
function DFS(node::BTree)
    println(node.bitpath)
    if !isa(node.right, Empty)
        #println(0)
        DFS(node.right)
    end
    
    if !isa(node.left, Empty)
        #println(1)
        DFS(node.left)
    end

    if isa(node.left, Empty) && isa(node.right, Empty)
        println(node.bitpath)
    end
end

# Function to create binary tree with a certain number of generations
function create_BTree(node::BTree, gen::Int64, max_gen::Int64, bitpath::String)

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
