import Foundation

func solution(n: Int) -> Int {
    
    var answer = ""
    let numbers = [4, 1, 2]
    
    func recursive(n: Int) {
        var result = n / 3
        let left = n % 3
        let value = numbers[left]
        if value == 4 {
            result -= 1
        }
        
        answer = String(value) + answer
        if result > 0 {
            recursive(n: result)
        }
        
    }
    
    recursive(n: n)
    
    return Int(answer) ?? 0
}