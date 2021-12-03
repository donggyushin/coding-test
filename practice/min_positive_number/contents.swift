import Foundation

func solution(_ A : [Int]) -> Int {
    let A = A.filter({ $0 > 0 }).sorted()
    if A.count == 0 { return 1 }
    if A[0] > 1 { return 1 }
    let array1 = A[0..<A.count-1]
    let array2 = A[1..<A.count]
    var answer = 0
    var changed = false
    for (item1, item2) in zip(array1, array2) {
        if item2 - item1 > 1 {
            answer = item1 + 1
            changed = true
            break
        }
    }
    
    if changed == false {
        return (A.last ?? 0) + 1
    }
    
    return answer
}