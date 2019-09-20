import UIKit

/**
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let newNode:ListNode? = ListNode(0)
    var p1 = l1
    var p2 = l2
    var curr = newNode
    var carry:Int = 0
    while p1 != nil && p2 != nil {
        let x = p1!.val
        let y = p2!.val
        
        let sum  = x + y + carry
        if sum >= 10 {
            carry = 1
            curr?.val = sum%10
        } else {
            carry = 0
            curr?.val = sum
        }
        
        p1 = p1?.next
        p2 = p2?.next
        if p1 != nil && p2 != nil {
            curr?.next = ListNode(0)
            curr = curr?.next
        } else {
            if p1 != nil {
                curr?.next = ListNode(0)
                curr = curr?.next
                p2 = ListNode(0)
                continue
            }
            if p2 != nil {
                curr?.next = ListNode(0)
                curr = curr?.next
                p1 = ListNode(0)
                continue
            }
        }
        
        
        
        
    }
    if carry > 0 {
        curr?.next = ListNode(carry)
    }
    
    return newNode
}
}


let l1 = ListNode(2)
l1.next
