import Foundation

func solution(_ people: [Int], _ limit: Int) -> Int {
    var people = people.sorted()
    var count = 0
    
    while people.isEmpty == false {
        let pop = people.removeLast()
        if let index = people.enumerated().first(where: { pop + $1 <= limit }).map({ $0.offset }) {
            people.remove(at: index)
        }
        count += 1
    }
    
    return count
}

func test() {
    print(solution([70, 50, 80, 50], 100), 3)
    print(solution([70, 80, 50], 100), 3)
}

test()
