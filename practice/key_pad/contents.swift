import Foundation

func get_distance(from: [Int], to: [Int]) -> UInt {
    return (from[0] - to[0]).magnitude + (from[1] - to[1]).magnitude
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var numbers = numbers.map({ "\($0)" })
    var left_position = "*"
    var right_position = "#"
    let hash_map: [String: [Int]] = [
        "1": [0, 3],
        "2": [1, 3],
        "3": [2, 3],
        "4": [0, 2],
        "5": [1, 2],
        "6": [2, 2],
        "7": [0, 1],
        "8": [1, 1],
        "9": [2, 1],
        "0": [1, 0],
        "*": [0, 0],
        "#": [2, 0]
    ]
    
    while numbers.isEmpty == false {
        let pop = numbers.removeFirst()
        switch pop {
        case "1", "4", "7":
            answer.append("L")
            left_position = pop
        case "3", "6", "9":
            answer.append("R")
            right_position = pop
        default:
            let l_d = get_distance(from: hash_map[left_position] ?? [], to: hash_map[pop] ?? [])
            let r_d = get_distance(from: hash_map[right_position] ?? [], to: hash_map[pop] ?? [])
            if l_d < r_d {
                answer.append("L")
                left_position = pop
            } else if l_d > r_d {
                answer.append("R")
                right_position = pop
            } else {
                if hand == "left" {
                    answer.append("L")
                    left_position = pop
                } else {
                    answer.append("R")
                    right_position = pop
                }
            }
        }
    }
    
    return answer
}