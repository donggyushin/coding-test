import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var costs = costs.sorted(by: { $0[2] < $1[2] })
    var connection_table: [Int] = (0..<n).map({ $0 })
    var answer = 0
    
    while connection_table.max() != 0 {
        if let cost = costs.enumerated().first(where: { connection_table[$1[0]] != connection_table[$1[1]] }) {
            costs.remove(at: cost.offset)
            answer += cost.element[2]
            let max = [connection_table[cost.element[0]], connection_table[cost.element[1]]].max() ?? 0
            let min = [connection_table[cost.element[0]], connection_table[cost.element[1]]].min() ?? 0
            connection_table = connection_table.map({ c -> Int in
                if c == max { return min } else { return c }
            })
        }
    }
    
    return answer
}

func test() {
    print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]), 4)
    print(solution(5, [[0, 1, 5], [1, 2, 3], [2, 3, 3], [3, 1, 2], [3, 0, 4], [2, 4, 6], [4, 0, 7]]), 15)
    print(solution(5, [[0, 1, 1], [3, 4, 1], [1, 2, 2], [2, 3, 4]]), 8)
    print(solution(4, [[0, 1, 5], [1, 2, 3], [2, 3, 3], [1, 3, 2], [0, 3, 4]]), 9)
    print(solution(5, [[0, 1, 1], [3, 1, 1], [0, 2, 2], [0, 3, 2], [0, 4, 100]]), 104)
}

test()
