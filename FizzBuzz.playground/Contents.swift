import UIKit
//multiple of three print Fizz
//multiple of five print Buzz


var num = 0

while num <= 100 {
    if num == 0 {
        print(num)
        num += 1
        continue
    }
    if num%3 == 0 {
        print("fizz")
        num += 1
        continue
    }
    if num%5 == 0 {
        print("buzz")
        num += 1
        continue
    }
    print(num)
    num += 1
}
