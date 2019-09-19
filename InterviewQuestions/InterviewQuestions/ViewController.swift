//
//  ViewController.swift
//  InterviewQuestions
//
//  Created by Jae Lee on 9/18/19.
//  Copyright © 2019 JaeLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let root = Node_BinarySearchTree(data: 2)
        root.insert(47)
        root.insert(1)
        root.insert(35)
        root.insert(34)
        root.insert(3)
        
        print(root.contains(32323))
        
        
        
        /** Sample nodes */
        // reversed node
        let nodeFive = Node(data: 5, next: nil)
        let nodeFour = Node(data: 4, next: nodeFive)
        let nodeThree = Node(data: 3, next: nodeFour)
        let nodeTwo = Node(data: 2, next: nodeThree)
        let nodeOne = Node(data: 1, next: nodeTwo)
        nodeOne.reverseInteractively()?.printNodeList()
        nodeOne.reverseRecursively()?.printNodeList()
        
        
        
        
        
    }
    
    


}

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
    
    // see if value contains in tree
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
        }
        else {
            if right == nil {
                return false
            } else {
                return right!.contains(value)
            }
        }
        
    }
    
    
    func isTreeIdentical(_ t1:Node_BinarySearchTree?, _ t2:Node_BinarySearchTree?) -> Bool {
        if t1 == nil && t2 == nil {
            return true
        }
        if t1 == nil {
            return false
        }
        if t2 == nil {
            return false
        }
        
        var s1 = [t1]
        var s2 = [t2]
        
        while (!s1.isEmpty && !s2.isEmpty) {
            let first1 = s1.first!
            let first2 = s2.first!
            
            if first1?.data != first2?.data {
                return false
            }
            s1.remove(at: 0)
            s2.remove(at: 0)
            
            if (first1?.left != nil)  && (first2?.left != nil) {
                s1.append(first1?.left!)
                s2.append(first2?.left!)
            } else {
                if first1?.left != nil || first2?.left != nil {
                    return false
                }
            }
            
            if (first1?.right != nil)  && (first2?.right != nil) {
                s1.append(first1?.right!)
                s2.append(first2?.right!)
            } else {
                if first1?.right != nil || first2?.right != nil {
                    return false
                }
            }
        }
        return true
    }
    
    
    
}


class Node {
    let data:Int
    var next:Node?
    
    init(data:Int, next:Node?) {
        self.data = data
        self.next = next
    }
    
    
    func reverseInteractively() -> Node? {
        var curr:Node? = self
        var next:Node?
        var prev:Node?
        
        while curr != nil {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        return prev
    }
    func reverseRecursively() -> Node? {
        if self.next == nil {
            return self
        }
        
        let newHead = self.next?.reverseInteractively()
        self.next?.next = self
        self.next = nil
        
        return newHead
    }

    
    func printNodeList() {
        var currentNode:Node? = self
        while currentNode != nil {
            print(currentNode?.data)
            currentNode = currentNode?.next
        }
    }
}
