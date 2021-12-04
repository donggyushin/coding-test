import Foundation

func can_change(word1: String, word2: String) -> Bool {
    var count = 0
    for (item1, item2) in zip(word1, word2) {
        if item1 != item2 { count += 1 }
        if count >= 2 {
            return false
        }
    }
    return count == 1
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let words = [begin] + words
    var answer: Int?
    let visited: [Bool] = .init(repeating: false, count: words.count)
    
    func bfs(i: Int, visited: [Bool], count: Int) {
        let current_word = words[i]
        if current_word == target {
            answer = min(answer ?? words.count, count)
            return
        }
        var visited = visited
        visited[i] = true
        if visited.first(where: { $0 == false }) == nil { return }
        
        words.enumerated().filter({ visited[$0] == false && can_change(word1: current_word, word2: $1) }).forEach({
            bfs(i: $0.offset, visited: visited, count: count + 1)
        })
    }
    
    bfs(i: 0, visited: visited, count: 0)
    
    return answer ?? 0
}