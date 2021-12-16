import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stages = stages.sorted()
    var fail_percentage: [Int: Double] = [:]
    for i in 1..<N+1 {
        let total = stages.count
        var count = 0
        while true {
            if stages.isEmpty {
                fail_percentage[i] = Double(count) / Double(total)
                break
            }
            let pop = stages.removeFirst()
            if pop == i {
                count += 1
            } else {
                fail_percentage[i] = Double(count) / Double(total)
                stages.insert(pop, at: 0)
                break
            }
        }
    }
    
    return fail_percentage.sorted(by: { $0.key < $1.key }).sorted(by: { $0.value > $1.value }).map({ $0.key })
}