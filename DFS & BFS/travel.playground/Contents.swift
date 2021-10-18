import Foundation

class Travel {
    private var results: [[[String]]] = []
    
    init(tickets: [[String]]) {
        for (index, ticket) in tickets.enumerated() {
            if ticket[0] == "ICN" {
                self.dfs(now: [ticket], tickets: Array(tickets[..<index]) + Array(tickets[index + 1..<tickets.count]))
            }
        }
    }
    
    private func dfs(now: [[String]], tickets: [[String]]) {
        if tickets.count == 0 {
            results.append(now)
        }
        
        for (index, ticket) in tickets.enumerated() {
            if let last = now.last {
                if isTravleAble(ticket1: last, ticket2: ticket) {
                    dfs(now: now + [ticket], tickets: Array(tickets[..<index]) + Array(tickets[index + 1..<tickets.count]))
                }
            }
        }
    }
    
    func get_results() -> [String] {
        var results = self.organize()
        results.sort { first, second in
            for (string1, string2) in zip(first, second) {
                
                if string1 > string2 {
                    return false
                } else if string1 < string2 {
                    return true
                }
            }
            return false
        }
        return results[0]
    }
    
    private func organize() -> [[String]] {
        var results: [[String]] = []
        
        self.results.map({
            var array: [String] = []
            $0.map({
                array.append($0[0])
            })
            if let last_node = $0.last {
                array.append(last_node[1])
            }
            results.append(array)
        })
        
        return results
    }
    
    private func isTravleAble(ticket1: [String], ticket2: [String]) -> Bool {
        return ticket1.last==ticket2.first
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    let travel = Travel(tickets: tickets)
    return travel.get_results()
}

func test() {
    print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])==["ICN", "JFK", "HND", "IAD"])
    print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])==["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"])
    print(solution([["ICN", "AOO"], ["AOO", "BOO"], ["AOO", "BOO"], ["BOO", "AOO"], ["BOO", "FOO"], ["FOO", "COO"], ["COO", "ZOO"]])==["ICN", "AOO", "BOO", "AOO", "BOO", "FOO", "COO", "ZOO"])
    print(solution([["ICN", "AOO"], ["AOO", "BOO"], ["AOO", "COO"], ["COO", "AOO"], ["BOO", "ZOO"]])==["ICN", "AOO", "COO", "AOO", "BOO", "ZOO"])
    print(solution([["ICN", "AOO"], ["AOO", "BOO"], ["BOO", "COO"], ["COO", "DOO"], ["DOO", "EOO"], ["EOO", "DOO"], ["DOO", "COO"], ["COO", "BOO"], ["BOO", "AOO"]])==["ICN", "AOO", "BOO", "COO", "DOO", "EOO", "DOO", "COO", "BOO", "AOO"])
    print(solution([["ICN", "B"], ["B", "ICN"], ["ICN", "A"], ["A", "D"], ["D", "A"]])==["ICN", "B", "ICN", "A", "D", "A"])
    print(solution([["ICN", "AAA"], ["ICN", "AAA"], ["ICN", "AAA"], ["AAA", "ICN"], ["AAA", "ICN"]])==["ICN", "AAA", "ICN", "AAA", "ICN", "AAA"])
    print(solution([["ICN", "COO"], ["ICN", "BOO"], ["COO", "ICN"], ["BOO", "DOO"]])==["ICN", "COO", "ICN", "BOO", "DOO"])
    print(solution([["ICN", "BOO"], ["ICN", "COO"], ["COO", "DOO"], ["DOO", "COO"], ["BOO", "DOO"], ["DOO", "BOO"], ["BOO", "ICN"], ["COO", "BOO"]])==["ICN", "BOO", "DOO", "BOO", "ICN", "COO", "DOO", "COO", "BOO"])
}

test()
