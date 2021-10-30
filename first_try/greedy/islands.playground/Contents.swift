import Foundation

func can_connect(cost: [Int], connected_table: [Int]) -> Bool {
    connected_table[cost[0]] != connected_table[cost[1]]
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var costs = costs
    costs.sort(by: {$0[2] < $1[2]})
    var answers: [Int] = []
    var connected_table = (0..<n).map({ $0 })
    
    func update() {
        guard let cost = costs.first(where: { can_connect(cost: $0, connected_table: connected_table) }) else { return }
        answers.append(cost[2])
        let will_change = connected_table[cost[1]]
        let to_change = connected_table[cost[0]]
        connected_table = connected_table.map({
            if $0 == will_change { return to_change } else { return $0 }
        })
        costs = costs.filter({ $0 != cost })
    }
    
    while !connected_table.map({ connected_table[0] == $0 }).reduce(true, { $0 && $1 }) {
        update()
    }
    
    return answers.reduce(0, {$0 + $1})
}

func test() {
    print(solution(5, [[0, 1, 5], [1, 2, 3], [2, 3, 3], [3, 1, 2], [3, 0, 4], [2, 4, 6], [4, 0, 7]]), 15)
    print(solution(5, [[0, 1, 1], [3, 4, 1], [1, 2, 2], [2, 3, 4]]), 8)
}

test()
