import Foundation

class Travel {
    private let tickets: [[String]]
    private var cases: [[[String]]] = []
    
    init(tickets:[[String]]) {
        self.tickets = tickets
        get_first_index().map({ dfs(current: [tickets[$0]], index: $0, visited: Array(repeating: false, count: tickets.count))})
    }
    
    private func dfs(current: [[String]], index: Int, visited: [Bool]) {
        if current.count == tickets.count { cases.append(current) }
        var visited = visited
        visited[index] = true
        guard let departure = current.last else { return }
        
        tickets.enumerated().forEach({
            if index != $0.offset, visited[$0.offset] == false, isTrableAble(ticket1: departure, ticket2: tickets[$0.offset]) {
                dfs(current: current + [tickets[$0.offset]], index: $0.offset, visited: visited)
            }
        })
        
    }
    
    private func get_first_index() -> [Int] {
        var result: [Int] = []
        tickets.enumerated().forEach({if $0.element[0] == "ICN" { result.append($0.offset)}})
        return result
    }
    
    private func isTrableAble(ticket1: [String], ticket2: [String]) -> Bool {
        ticket1.last==ticket2.first
    }
    
    func answer() -> [String] {
        var cases = self.cases
        cases.sort { case1, case2 in
            for (c1, c2) in zip(case1, case2) {
                if c1[0] > c2[0] { return false }
                if c1[0] < c2[0] { return true }
            }
            return false
        }
        var result: [String] = []
        cases[0].map({ result.append($0[0])})
        result.append(cases[0].last?[1] ?? "")
        return result
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    return Travel(tickets: tickets).answer()
}