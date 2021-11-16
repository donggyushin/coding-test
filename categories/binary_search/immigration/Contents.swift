import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted().map { Int64($0) }
    var left: Int64 = 0
    var right: Int64 = (times.last ?? 0) * Int64(n)
    var answers: [Int64] = []
    
    while true {
        let center = Int64((left + right) / 2)
        if center == left { break }
        let total_people_number = times.reduce(0, { $0 + center / $1 })
        if total_people_number >= n {
            right = center
            answers.append(center)
        } else {
            left = center
        }
    }
    
    return answers.sorted().first ?? 0
}