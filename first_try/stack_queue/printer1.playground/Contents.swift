import Foundation

private func delay(priorities:[Int], location:Int) -> ([Int], Int) {
    var priorities = priorities
    var location = location
    
    let firstElement = priorities.removeFirst()
    priorities.append(firstElement)
    
    if location == 0 {
        location = priorities.count - 1
    } else {
        location -= 1
    }
    return (priorities, location)
}

private func isShouldDelay(priorities:[Int]) -> Bool {
    var result = false
    var priorities = priorities
    let firstElement = priorities.removeFirst()
    for priority in priorities {
        if firstElement < priority {
            result = true
        }
    }
    return result
}

private func do_print(priorities:[Int], location:Int) -> ([Int], Int) {
    var priorities = priorities
    var location = location
    priorities.removeFirst()
    location -= 1
    return (priorities, location)
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var result = 0
    
    var priorities = priorities
    var location = location
    
    while (location != -1) {
        if isShouldDelay(priorities: priorities) {
            (priorities, location) = delay(priorities: priorities, location: location)
        } else {
            (priorities, location) = do_print(priorities: priorities, location: location)
            result += 1
        }
    }
    
    return result
}

func test() {
    guard solution([2, 1, 3, 2], 2) == 1 else { return print("test fail")}
    guard solution([1, 1, 9, 1, 1, 1], 0) == 5 else { return print("test fail")}
    print("test success")
}

test()
