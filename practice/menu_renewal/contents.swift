import Foundation

func is_contain(p: String, c: String) -> Bool {
    for char in c {
        if p.contains(char) == false {
            return false
        }
    }
    return true
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var answers: [String] = []
    var all_cases: Set<String> = []
    var dict: [String: Int] = [:]
    
    func recursive(i: Int, current: String, word: String) {
        if current.count >= 2 {all_cases.insert(current)}
        if i == word.count - 1 { return }
        word.enumerated().filter({ $0.offset > i }).forEach({
            recursive(i: $0, current: current + String($1), word: word)
        })
    }
    
    for order in orders {
        order.enumerated().forEach({
            recursive(i: $0, current: String($1), word: order)
        })
    }
    
    for each_case in all_cases {
        
        var count = 0
        orders.forEach({
            if is_contain(p: $0, c: each_case) { count += 1 }
        })
        
        if count >= 2 {
            dict[String(each_case.sorted())] = count
        }
    }
    
    for course in course {
        var dict = dict.filter({ $0.key.count == course }).sorted(by: { $0.value > $1.value })
        let max_count = dict.first?.value ?? 0
        dict = dict.filter({ $0.value == max_count })
        dict.forEach({ answers.append($0.key) })
    }
    
    answers.sort()
    return answers
}