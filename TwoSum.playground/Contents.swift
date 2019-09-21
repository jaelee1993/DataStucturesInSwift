import UIKit
/**
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashTable:[Int:Int] = [:]
    for (i,num) in nums.enumerated() {
        hashTable[num] = i
    }
    for (i,num) in nums.enumerated() {
        let compliment = target - num
        
        
        guard let x = hashTable[compliment] else {continue}
        if i != hashTable[compliment] {
            return [x,i]
        }
        
        
    }
    return []
}


print(twoSum([1,3,4,2], 6))


