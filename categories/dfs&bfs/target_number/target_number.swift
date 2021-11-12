import Foundation

func solution(_ numbers: [Int], _ target: Int) -> Int {
    var answer = 0
    
    func dfs(i: Int, value: Int) {
        if i == numbers.count - 1 {
            if value == target { answer += 1 }
            return
        }
        
        dfs(i: i + 1, value: value + numbers[i + 1])
        dfs(i: i + 1, value: value - numbers[i + 1])
    }
    
    dfs(i: 0, value: numbers[0])
    dfs(i: 0, value: -numbers[0])
    
    return answer
}
