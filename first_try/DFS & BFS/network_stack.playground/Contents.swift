import Foundation

func dfs(computers: [[Int]], visited: [Bool]) -> [Bool] {
    var stack: [[Int]] = []
    var visited = visited
    
    var first_index = 0
    for i in 0..<visited.count {
        if visited[i] == false {
            first_index = i
            break
        }
    }
    
    stack.append(computers[first_index])
    
    visited[first_index] = true
    
    var i = 0
    while stack.isEmpty == false {
        let pop = stack.removeLast()
        for j in 0..<pop.count {
            if i != j, pop[j] == 1, visited[j] == false {
                stack.append(computers[j])
                visited[j] = true
            }
        }
        i += 1
    }

    return visited
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited: [Bool] = computers.map({ _ in false })
    var answer = 0
    
    while visited.reduce(true, { $0 && $1 }) == false {
        visited = dfs(computers: computers, visited: visited)
        answer += 1
    }
    
    return answer
}

func test() {
    print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])==2)
    print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])==1)
}

test()
