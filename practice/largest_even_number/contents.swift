import Foundation

func solution(_ A : [Int], _ K : Int) -> Int {
    var answer: Int = 0
    func recursive(i: Int, cases: [Int]) {
        if cases.count == K {
            let sum = cases.reduce(0, +)
            if sum % 2 == 0 {
                answer = max(sum, answer)
            }
            return
        }
        
        if i == A.count - 1 { return }
        
        A.enumerated().filter({ $0.offset > i }).forEach({recursive(i: $0, cases: cases + [$1])})
    }
    
    A.enumerated().forEach({recursive(i: $0, cases: [$1])})
    return answer == 0 ? -1 : answer
}