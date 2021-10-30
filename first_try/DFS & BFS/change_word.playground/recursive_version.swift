import Foundation

class DFS {
    private let target: String
    private let words: [String]
    private var cases: [[String]] = []
    
    
    init(_ begin:String, _ target:String, _ words:[String]) {
        var words = words
        words.insert(begin, at: 0)
        self.target = target
        self.words = words
        dfs(current: [], index: 0, visited: Array(repeating: false, count: words.count))
    }
    
    private func dfs(current: [String], index: Int, visited: [Bool]) {
        var visited = visited
        visited[index] = true
        if words[index] == target {
            cases.append(current)
            return
        }
        
        words.enumerated().forEach({
            if index != $0.offset, visited[$0.offset] == false, isChangeAble(word1: words[index], word2: words[$0.offset]) {
                dfs(current: current + [words[$0.offset]], index: $0.offset, visited: visited)
            }
        })
    }
    
    private func isChangeAble(word1: String, word2: String) -> Bool {
        var count = 0
        for (c1, c2) in zip(word1, word2) { if c1 != c2 { count += 1 }}
        return count <= 1
    }
    
    func answer() -> Int {
        return (cases.map({ $0.count }).sorted().first ?? 0)
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    return DFS(begin, target, words).answer()
}