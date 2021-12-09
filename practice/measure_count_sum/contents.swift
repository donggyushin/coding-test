import Foundation

func count_of_measure(num: Int) -> Int {
    var count = 0
    for i in 1..<num+1 {
        if num % i == 0 { count += 1 }
    }
    return count
}

func solution(_ left:Int, _ right:Int) -> Int {
    return (left..<right+1).map({ $0 }).reduce(0, { count_of_measure(num: $1) % 2 == 0 ? $0 + $1 : $0 - $1 })
}