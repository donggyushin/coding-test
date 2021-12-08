import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stages = stages
    var fail_percents: [Int: Float] = [:]
    for i in 1..<N+1 {
        let total_count = stages.count
        if stages.contains(i) {stages = stages.filter({ $0 != i })}
        let diff = total_count - stages.count
        fail_percents[i] = Float(diff) / Float(total_count)
    }
    return fail_percents.sorted(by: { $0.key < $1.key }).sorted(by: { $0.value > $1.value }).map({ $0.key })
}