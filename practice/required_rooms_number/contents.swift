import Foundation

public func solution(_ A : [Int]) -> Int {
    let A = A.sorted(by: >)
    var rooms: [[Int]] = .init(repeating: [], count: A.count)
    
    A.forEach({
        for (i, room) in rooms.enumerated() {
            let min = room.min() ?? A.count
            if min >= (room.count + 1) && $0 >= (room.count + 1) {
                let room = room + [$0]
                rooms[i] = room
                break
            }
        }
    })
    return rooms.filter({ $0.count > 0 }).count
}