import Foundation

class TargetNumber {
    private let target: Int
    private let numbers: [Int]
    var answer = 0
    
    init(numbers: [Int], target: Int) {
        self.numbers = numbers
        self.target = target
        
        dfs(index: 0, value: self.numbers[0])
        dfs(index: 0, value: -self.numbers[0])
    }
    
    private func dfs(index: Int, value: Int) {
        if index == self.numbers.count - 1 {
            if value == target { answer += 1 }
            return
        }
        dfs(index: index + 1, value: value + numbers[index + 1])
        dfs(index: index + 1, value: value - numbers[index + 1])
    }
}

func solution(_ numbers: [Int], _ target: Int) -> Int {
    TargetNumber(numbers: numbers, target: target).answer
}