import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zero_count = lottos.filter({ $0 == 0 }).count
    let right_number_count = lottos.filter({ win_nums.contains($0) }).count
    
    return [min(7 - right_number_count - zero_count, 6), min(7 - right_number_count, 6)]
}