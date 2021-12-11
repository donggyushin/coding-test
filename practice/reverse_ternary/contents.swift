import Foundation

func make_ternary(n: Int, answer: String) -> String {
    var answer = answer
    answer.insert(Character(String(n % 3)), at: answer.startIndex)
    return (n / 3) == 0 ? answer : make_ternary(n: (n / 3), answer: answer)
}

func solution(_ n:Int) -> Int {
    var answer = 0
    let ternary = make_ternary(n: n, answer: "")
    for i in 0..<ternary.count {
        answer += (ternary[ternary.index(ternary.startIndex, offsetBy: i)].wholeNumberValue ?? 0) * Int(truncating: NSDecimalNumber(decimal: pow(3, i)))
    }
    
    return answer
}