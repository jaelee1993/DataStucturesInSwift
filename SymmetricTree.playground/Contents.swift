import UIKit

public class TreeNode {
 public var val: Int
 public var left: TreeNode?
 public var right: TreeNode?
 public init(_ val: Int) {
     self.val = val
     self.left = nil
     self.right = nil
 }
}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        if root != nil {
            return isMirror(root!.left, root!.right)
        }
        return true
        
        
    }
    
    func isMirror(_ t1:TreeNode?, _ t2:TreeNode?) -> Bool{
        if t1 == nil && t2 == nil {
            return true
        }
        if t1 == nil || t2 == nil {
            return false
        }
        return (t1!.val == t2!.val) && isMirror(t1!.left, t2!.right) && isMirror(t1!.right, t2!.left)
        
    }
}
