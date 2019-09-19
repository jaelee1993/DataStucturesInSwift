import UIKit


/**
 Binary Search Tree : Left node is less than root node
 */
class Node_BinarySearchTree {
    var left:Node_BinarySearchTree?
    var right:Node_BinarySearchTree?
    var data:Int
    
    init(data:Int) {
        self.data = data
    }
    
    /** Insert node to tree*/
    func insert(_ value:Int) {
        if value <= data {
            if left == nil {
                left = Node_BinarySearchTree (data: value)
            } else {
                left!.insert(value)
            }
        } else {
            if right == nil {
                right = Node_BinarySearchTree (data: value)
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
    
    /** Prints all values in tree "In order"*/
    func printInOrder() {
        if left != nil {
            left!.printInOrder()
        }
        
        print(data)
        
        if right != nil {
            right!.printInOrder()
        }
    }
    /** Prints all values in tree "Pre order"*/
    func printPreOrder() {
        print(data)
        
        if left != nil {
            left!.printInOrder()
        }
        
        if right != nil {
            right!.printInOrder()
        }
    }
    
    /** Prints all values in tree "Post order"*/
    func printPostOrder() {
        if left != nil {
            left!.printPostOrder()
        }
        
        if right != nil {
            right!.printPostOrder()
        }
        
        print(data)
    }
    
    
}

func isTreesIdentical(treeOne:Node_BinarySearchTree?, treeTwo:Node_BinarySearchTree?) -> Bool {
    if treeOne == nil && treeTwo == nil {
        return true
    }
    
    if treeOne == nil {
        return false
    }
    if treeTwo == nil {
        return false
    }
   
    var q1 = [treeOne]
    var q2 = [treeTwo]
    
    while(!q1.isEmpty && !q2.isEmpty) {
        let first1 = q1.first!
        let first2 = q2.first!
        
        if first1?.data != first2?.data {
            return false
        }
        
        q1.remove(at: 0)
        q2.remove(at: 0)
        
        if first1!.left != nil && first2!.left != nil {
            q1.append(first1!.left)
            q2.append(first2!.left)
        } else {
            if first1!.left != nil || first2!.left != nil {
                return false
            }
        }
        if first1!.right != nil && first2!.right != nil {
            q1.append(first1!.right)
            q2.append(first2!.right)
        } else {
            if first1!.right != nil || first2!.right != nil {
                return false
            }
        }
    }
    
    return true
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
rootNode.insert(1 )


let rootNodeTwo = Node_BinarySearchTree(data: 9)

/** inserting */
rootNodeTwo.insert(6)
rootNodeTwo.insert(34)
rootNodeTwo.insert(3)
rootNodeTwo.insert(1)
rootNodeTwo.insert(3)
rootNodeTwo.insert(33)
rootNodeTwo.insert(2)
rootNodeTwo.insert(10)
rootNodeTwo.insert(26266)



/** checks to see if it contains */
//print(rootNode.contains(33))

/** prints all InOrder */
//print("In order")
//print(rootNode.printInOrder())

/** prints all PreOrder */
//print("Pre order")
//print(rootNode.printPreOrder())


/** prints all PostOrder */
//print("Post order")
//print(rootNode.printPostOrder())


print(isTreesIdentical(treeOne: rootNode, treeTwo: rootNodeTwo))
