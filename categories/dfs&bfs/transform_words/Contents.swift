import Foundation

func is_change_able(word1: String, word2: String) -> Bool {
    var count = 0
    for (c1, c2) in zip(word1, word2) {
        if c1 != c2 { count += 1 }
    }
    return count <= 1
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var answers: [Int] = []
    var words = words
    words.insert(begin, at: 0)
    
    func dfs(current: String, visited: [Bool], i: Int, count: Int) {
        var visited = visited
        visited[i] = true
        let filtered = words.enumerated().filter({ is_change_able(word1: $1, word2: current) && visited[$0] == false })
        var go_on = true
        for (_, element) in filtered {
            if element == target {
                go_on = false
                break
            }
        }
        if go_on {
            filtered.forEach {
                dfs(current: words[$0.offset], visited: visited, i: $0.offset, count: count + 1)
            }
        } else {
            answers.append(count + 1)
        }
    }
    
    dfs(current: begin, visited: words.map { _ in false }, i: 0, count: 0)
    
    return answers.min() ?? 0
}
