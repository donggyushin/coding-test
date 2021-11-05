import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    
    for command in commands {
        answer.append(array[command[0] - 1..<command[1]].sorted()[command[2] - 1])
    }
    
    return answer
}

func test() {
    print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]), [5, 6, 3])
}

test()
