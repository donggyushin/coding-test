import Foundation
class Network {
    private var visited: [Bool]
    private let computers: [[Int]]
    var answer = 0
    
    init(computers: [[Int]]) {
        self.computers = computers
        self.visited = Array(repeating: false, count: computers.count)
        
        for i in 0..<self.computers.count {
            if !visited[i] {
                dfs(index: i)
                answer += 1
            }
        }
        
    }

    private func dfs(index: Int) {
        visited[index] = true
        computers.enumerated().forEach({if index != $0.offset, visited[$0.offset] == false, computers[index][$0.offset] == 1 { dfs(index: $0.offset)}})
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    return Network(computers: computers).answer
}