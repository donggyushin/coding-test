import Foundation

class TargetNumber {
    private let numbers: [Int]
    private let target: Int
    private var case_numbers: [[Int]] = []
    
    init(numbers: [Int], target: Int) {
        self.numbers = numbers
        self.target = target
        
        dfs(array: [self.numbers[0]], level: 1)
        dfs(array: [-self.numbers[0]], level: 1)
    }
    
    private func dfs(array: [Int], level: Int) {
        if level == numbers.count {
            if array.reduce(0, {$0+$1}) == target { case_numbers.append(array) }
            return
        }
        
        var array1 = array
        var array2 = array
        
        array1.append(numbers[level])
        array2.append(-numbers[level])
        
        dfs(array: array1, level: level + 1)
        dfs(array: array2, level: level + 1)
    }
    
    func get_case_numbers() -> Int {
        return case_numbers.count
    }
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    TargetNumber(numbers: numbers, target: target).get_case_numbers()
}

func test() {
    print(solution([1, 1, 1, 1, 1], 3)==5)
}

test()
