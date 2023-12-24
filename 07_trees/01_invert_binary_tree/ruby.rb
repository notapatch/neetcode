require_relative 'tree'
require 'minitest/autorun'

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  return nil if root.nil?

  # puts root.value
  temp = root.left
  root.left = root.right
  root.right = temp

  invert_tree(root.left)
  invert_tree(root.right)
  root
end

def process_tree(root)
  return root, [] if root.nil?

  values = []
  in_order_traversal(root, values)
  return root, values
end

def in_order_traversal(node, values)
  return if node.nil?

  values << node.value
  in_order_traversal(node.left, values)
  in_order_traversal(node.right, values)
end


class TestInvertTree < Minitest::Test
  # def test_full_tree
  #   @tree = BinaryTree.new
  #
  #   @tree.insert(4)
  #   @tree.insert(2)
  #   @tree.insert(7)
  #   @tree.insert(1)
  #   @tree.insert(3)
  #   @tree.insert(6)
  #   @tree.insert(9)
  #
  #   tree = invert_tree(@tree.root)
  #   _, values = process_tree(tree)
  #   assert_equal [4, 7, 9, 6, 2, 3, 1], values
  # end

  def test_small_tree
    @tree = BinaryTree.new

    @tree.insert(2)
    @tree.insert(1)
    @tree.insert(3)

    tree = invert_tree(@tree.root)
    _, values = process_tree(tree)
    assert_equal [2, 3, 1], values
  end

  # def test_empty_tree
  #   @tree = BinaryTree.new
  #
  #   tree = invert_tree(@tree.root)
  #   _, values = process_tree(tree)
  #   assert_equal [], values
  # end
end
