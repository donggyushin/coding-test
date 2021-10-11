import Foundation

enum Operation {
    case insert
    case delete_max
    case delete_min
}

private func get_min(result: [Int]) -> Int {
    var result = result
    result.sort()
    return result.first ?? 0
}

private func get_max(result: [Int]) -> Int {
    var result = result
    result.sort()
    return result.last ?? 0
}

private func delete_min(result: [Int]) -> [Int] {
    var result = result
    
    if result.isEmpty {
        return result
    }
    
    result.sort()
    result.removeFirst()
    return result
}

private func delete_max(result: [Int]) -> [Int] {
    var result = result
    
    if result.isEmpty {
        return result
    }
    
    result.sort()
    result.removeLast()
    return result
}

private func insert(result: [Int], item: Int) -> [Int] {
    var result: [Int] = result
    result.append(item)
    return result
}

private func generate_operation(string: String) -> (Operation, Int) {
    var operation: Operation = .insert
    var value = 0
    let splits = string.split(separator: " ")
    if splits[0] == "I" {
        operation = .insert
    } else if splits[0] == "D", Int(splits[1]) == 1 {
        operation = .delete_max
    } else if splits[0] == "D", Int(splits[1]) == -1 {
        operation = .delete_min
    }
    value = Int(splits[1]) ?? 0
    return (operation, value)
}

func solution(_ operations:[String]) -> [Int] {
    var result: [Int] = []
    var operation: Operation = .insert
    var value: Int = 0
    
    operations.forEach { operation_string in
        (operation, value) = generate_operation(string: operation_string)
        
        switch operation {
        case .delete_max:
            result = delete_max(result: result)
        case .delete_min:
            result = delete_min(result: result)
        case .insert:
            result = insert(result: result, item: value)
        }
    }
    
    return [get_max(result: result), get_min(result: result)]
}

func test() {
    print(solution(["I 16","D 1"]), "[0, 0]")
    print(solution(["I 7","I 5","I -5","D -1"]), "[7, 5]")
    print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]), "[0, 0]")
}

test()
