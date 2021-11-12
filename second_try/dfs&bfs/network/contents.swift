import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var visited = computers.map({ _ in false })
    var answer = 0
    func dfs(i: Int) {
        visited[i] = true
        computers.enumerated().filter({ $0 != i && visited[$0] == false && $1[i] == 1 }).map({ $0.offset }).forEach({dfs(i: $0)})
    }
    
    while !visited.reduce(true, { $0 && $1 }) {
        answer += 1
        if let i = visited.enumerated().first(where: { $1 == false }).map({ $0.offset }) { dfs(i: i) }
    }
    
    return answer
}