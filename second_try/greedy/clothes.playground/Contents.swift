import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let filtered_lost = lost.filter({ !reserve.contains($0) }).sorted()
    let filtered_reverse = reserve.filter({ !lost.contains($0) }).sorted()
    
    var lost_visited = filtered_lost.map({ _ in false })
    var reverse_visited = filtered_reverse.map({ _ in false })
    
    for (i, lost) in filtered_lost.enumerated() {
        for (j, reserve) in filtered_reverse.enumerated() {
            if (lost - reserve).magnitude <= 1, reverse_visited[j] == false {
                lost_visited[i] = true
                reverse_visited[j] = true
                break
            }
        }
    }
    
    return n - lost_visited.filter({ $0 == false }).count
}
