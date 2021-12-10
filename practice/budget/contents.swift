import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let d = d.sorted()
    var budget = budget
    var answer = 0
    for item in d {
        if budget >= item {
            answer += 1
            budget = budget - item
        } else {
            break
        }
    }
    return answer
}