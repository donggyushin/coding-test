import Foundation

func isPrime(number: Int) -> Bool {
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ numbers:String) -> Int {
    var cases: Set<Int> = []
    let numbers = numbers.map({ String($0) })
    let visited = numbers.map({ _ in false })
    
    func recursive(current: String, visited: [Bool], i: Int) {
        if let current = Int(current), current >= 2 { cases.insert(current) }
        var visited = visited
        visited[i] = true
        for (j, visit) in visited.enumerated() {
            if visit == false {
                recursive(current: current + numbers[j], visited: visited, i: j)
            }
        }
    }
    
    for i in 0..<visited.count {
        recursive(current: numbers[i], visited: visited, i: i)
    }
    
    return cases.filter({ isPrime(number: $0) }).count
}

func test() {
    print(solution("011"), 2)
    print(solution("17"), 3)
}

test()
