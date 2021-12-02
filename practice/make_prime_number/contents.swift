import Foundation

func is_prime(num: Int) -> Bool {
    for i in 2..<(num/2)+1 {
        if num % i == 0 { return false }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var cases: [[Int]] = []
    var answer = 0
    
    func dfs(i: Int, current: [Int]) {
        if current.count == 3 {
            cases.append(current)
            return
        }
        if i == nums.count - 1 { return }
        
        for i in i+1..<nums.count {
            var current = current
            current.append(nums[i])
            dfs(i: i, current: current)
        }
    }
    
    nums.enumerated().forEach({ dfs(i: $0, current: [$1]) })
    cases.forEach({ if is_prime(num: $0.reduce(0, +)) { answer += 1 }})
    
    return answer
}