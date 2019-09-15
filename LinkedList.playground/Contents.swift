import UIKit

// Single Linked List for print & reverse
class Node {
    let data:Int
    var next:Node?
    
    init(data:Int, next:Node?) {
        self.data = data
        self.next = next
    }
}

/** Sample nodes */
let nodeThree = Node(data: 3, next: nil)
let nodeTwo = Node(data: 2, next: nodeThree)
let nodeOne = Node(data: 1, next: nodeTwo)

/** Print Lists */
func printNodeList(_ headNode:Node) {
    var currentNode:Node? = headNode

    while (currentNode != nil) {
        print(currentNode?.data)
        currentNode = currentNode?.next
    }
    
}


func reverseNodeList(_ headNode:Node)  -> Node? {
    var currentNode:Node? = headNode
    var next:Node?
    var prev:Node?
    
    while (currentNode != nil) {
        next = currentNode?.next
        currentNode?.next = prev // setting currentNode.next to previous to reverse order of pointer
        prev = currentNode // setting previous to current node for next iteration of while loop
        currentNode = next
    }
    
    return prev
    
    
}

print("Original")
printNodeList(nodeOne)

let reversedHead = reverseNodeList(nodeOne)
print("Reversed")
printNodeList(reversedHead!)
