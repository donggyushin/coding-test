import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    let edge = edge.sorted(by: {$0[0] < $1[0]})
    var visited: [Bool] = Array(repeating: false, count: n)
    var queue: [Int] = [1]
    var answers: [Int] = []
    visited[0] = true
    
    while !queue.isEmpty {
        answers = queue
        for _ in 0..<queue.count {
            let pop = queue.removeFirst()
            for (item) in edge {
                if item.contains(pop) {
                    if let next = item.filter({ $0 != pop }).first, visited[next - 1] == false {
                        visited[next - 1] = true
                        queue.append(next)
                    }
                }
            }
        }
    }
    
    return answers.count
}

func test() {
    print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 3)
    print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 3)
    print(solution(11, [[1, 2], [1, 3], [2, 4], [2, 5], [3, 5], [
          3, 6], [4, 8], [4, 9], [5, 9], [5, 10], [6, 10], [6, 11]]), 4)
    print(solution(4, [[1, 2], [2, 3], [3, 4]]), 1)
    print(solution(2, [[1, 2]]), 1)
    print(solution(5, [[4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 2)
    print(solution(4, [[1, 2], [1, 3], [2, 3], [2, 4], [3, 4]]), 1)
    print(solution(4, [[1, 4], [1, 3], [2, 3], [2, 1]]), 3)
    print(solution(4, [[3, 4], [1, 3], [2, 3], [2, 1]]), 1)
    print(solution(4, [[4, 3], [1, 3], [2, 3]]), 2)
}

test()
