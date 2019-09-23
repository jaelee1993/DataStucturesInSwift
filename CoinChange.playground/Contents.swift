import UIKit

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
       var dp:Array<Int> = Array(repeating: amount + 1, count: amount + 1)
       
       dp[0] = 0
       
       print("dp = \(dp)")
       for i in 0...amount{
           for (j,coin) in coins.enumerated() {
               if coin <= i {

                   dp[i] = min(dp[i], 1 + dp[i - coin])
                
               }
           }
       }
    
        print(dp)
        return dp[amount] > amount ? -1 : dp[amount]
   }


let i = [1,2,5]
coinChange(i, 6)

