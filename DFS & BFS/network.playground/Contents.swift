import Foundation

func dfs(computers: [[Int]], checks: [Bool], i: Int) -> [Bool] {
    var checks = checks
    checks[i] = true
    
    for j in 0..<computers.count {
        if i != j, computers[i][j] == 1, checks[j] == false {
            checks = dfs(computers: computers, checks: checks, i: j)
        }
    }
    
    return checks
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        
    var answer = 0
    var checks = computers.map({ _ in false })
    
    for i in 0..<n {
        if !checks[i] {
            checks = dfs(computers: computers, checks: checks, i: i)
            answer += 1
            
        }
    }
    return answer
}

func test() {
    print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])==2)
    print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])==1)
}

test()
