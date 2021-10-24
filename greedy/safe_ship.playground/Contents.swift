import Foundation

func carry(people: [Int], limit: Int, visited: [Bool]) -> [Bool] {
    var visited = visited
    
    let i = visited.enumerated().first(where: { $0.element == false }).map({ $0.offset }) ?? 0
    visited[i] = true
    var sum = 0
    var j = 0
    visited.enumerated().forEach({ if people[i] + people[$0.offset] <= limit, $0.element == false, people[i] + people[$0.offset] > sum {
        sum = people[i] + people[$0.offset]
        j = $0.offset
    }})
    visited[j] = true
    
    return visited
}

func solution(_ people: [Int], _ limit: Int) -> Int {
    
    var visited = people.map({ _ in false })
    var answer = 0
    while visited.reduce(true, { $0 && $1 }) == false {
        visited = carry(people: people, limit: limit, visited: visited)
        answer += 1
    }
    
    return answer
}

func test() {
    print(solution([70, 50, 80, 50], 100), 3)
    print(solution([70, 80, 50], 100), 3)
    print(solution([40,50,150,160], 200), 2)
    print(solution([100,500,500,900,950], 1000), 3)
}

test()
