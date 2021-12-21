import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var index = 0
    var answer = 0
    
    var participants: [Int] = (1..<n+1).map({ $0 })
    
    func play(participants: [Int]) -> [Int] {
        var left: [Int] = []
        var participants = participants
        while participants.isEmpty == false {
            let first = participants.removeFirst()
            if participants.isEmpty { break }
            let second = participants.removeFirst()
            
            if [a, b].contains(first) && [a, b].contains(second) {
                answer = index
                break
            }
            
            if first == a || first == b {
                left.append(first)
            } else {
                left.append(second)
            }
        }
        return left
    }
    
    while participants.isEmpty == false {
        index += 1
        participants = play(participants: participants)
        if answer != 0 { break }
    }
    
    return answer
}