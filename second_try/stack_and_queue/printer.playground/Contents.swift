import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var answer = 0
    var priorities = priorities
    var location = location
    
    while priorities.isEmpty == false {
        let first_priority = priorities.first ?? 0
        var should_change = false
        for priority in priorities {
            if first_priority < priority {
                should_change = true
                break
            }
        }
        let pop = priorities.removeFirst()
        if should_change {
            priorities.append(pop)
        } else {
            answer += 1
            if location == 0 { break }
        }
        location -= 1
        location = location < 0 ? priorities.count - 1 : location
    }
    
    return answer
}

func test() {
    print(solution([2, 1, 3, 2], 2), 1)
}

test()
