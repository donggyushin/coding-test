import Foundation

private func isChangeAble(word1: String, word2: String) -> Bool {
    
    var hashMap: [String.Element: Int] = [:]
    
    Array(word1).map({
        if let value = hashMap[$0] {
            hashMap[$0] = value + 1
        } else {
            hashMap[$0] = 1
        }
    })
    Array(word2).map({
        if let value = hashMap[$0] {
            hashMap[$0] = value - 1
        }
    })
    var overOneCount = 0
    hashMap.map({ if $0.value >= 1 { overOneCount += 1 } })
    return overOneCount < 2
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    var queue: [String] = []
    var answer = 0
    var isVisited: [Bool] = words.map({ _ in false })
    
    queue.append(begin)
    
    while queue.isEmpty == false {
        answer += 1
        
        for _ in queue {
            let pop = queue.removeFirst()
            
            for (j, word) in words.enumerated() {
                if isChangeAble(word1: pop, word2: word), isVisited[j] == false {
                    
                    if word == target {
                        return answer
                    }
                    
                    isVisited[j] = true
                    queue.append(word)
                }
            }
        }
        
        
    }
    
    return 0
}

func test() {
    print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])==4)
    print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"])==0)
}

test()
