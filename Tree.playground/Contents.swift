import UIKit


/**
 Binary Search Tree : Left node is less than root node
 */
class Node_BinarySearchTree {
    var left:Node?
    var right:Node?
    var data:Int
    
    init(data:Int) {
        self.data = data
    }
    
    /** Insert node to tree*/
    func insert(_ value:Int) {
        if value <= data {
            if left == nil {
                left = Node(data: value)
            } else {
                left!.insert(value)
            }
        } else {
            if right == nil {
                right = Node(data: value)
            } else {
                right!.insert(value)
            }
        }
    }
    
    /** Check to see if value contains in tree */
    func contains(_ value:Int) -> Bool {
        if data == value {
            return true
        }
        
        if value < data {
            if left == nil {
                return false
            } else {
                return left!.contains(value)
            }
        } else {
            if right == nil {
                return false
            } else {
                return right!.contains(value)
            }
        }
    }
    
    /** Prints all values in tree in order*/
    func printInOrder() {
        if left != nil {
            left!.printInOrder()
        }
        
        print(data)
        
        if right != nil {
            right!.printInOrder()
        }
    }
    
}

/** setting initial root node for Tree */
let rootNode = Node_BinarySearchTree(data: 9)

/** inserting */
rootNode.insert(6)
rootNode.insert(34)
rootNode.insert(3)
rootNode.insert(1)
rootNode.insert(3)
rootNode.insert(33)
rootNode.insert(2)
rootNode.insert(10)
rootNode.insert(2)

/** checks to see if it contains */
print(rootNode.contains(33))

/** prints all in order */
print(rootNode.printInOrder())
