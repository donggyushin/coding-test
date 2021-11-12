import Foundation

func solution(_ operations: [String]) -> [Int] {
    var heap: [Int] = []
    
    for operation in operations {
        if operation.first == "I" {
            if let value = Int(operation.split(separator: " ")[1]) {
                heap.append(value)
            }
        } else if operation == "D 1" {
            if let max = heap.max(), let index = heap.firstIndex(of: max) {
                heap.remove(at: index)
            }
        } else if operation == "D -1" {
            if let min = heap.min(), let index = heap.firstIndex(of: min) {
                heap.remove(at: index)
            }
        }
    }
    
    return [heap.max() ?? 0, heap.min() ?? 0]
}

func test() {
    print(solution(["I 16","D 1"]), [0,0])
    print(solution(["I 7","I 5","I -5","D -1"]), [7,5])
}

test()
