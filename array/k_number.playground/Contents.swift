import Foundation

private func getK(array: [Int], commands: [Int]) -> Int {
    var result = 0
    let length = commands[1] - commands[0] + 1
    var new_array: [Int] = []
    
    var start_index = commands[0] - 1
    
    for _ in 0..<length {
        new_array.append(array[start_index])
        start_index += 1
    }
    
    new_array.sort()
    result = new_array[commands[2] - 1]
    
    return result
}

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    
    for command in commands {
        result.append(getK(array: array, commands: command))
    }
    
    return result
}

func test() {
    print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]), "[5, 6, 3]")
}

test()
