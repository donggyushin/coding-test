import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var moves = moves.map({ $0 - 1 })
    var board = board
    var box: [Int] = []
    var answer = 0
    
    while moves.isEmpty == false {
        let pop = moves.removeFirst()
        if let board_to_remove = board.enumerated().filter({ $1[pop] != 0 }).first {
            let row_to_change = board_to_remove.offset
            var board_to_remove = board_to_remove.element
            let doll = board_to_remove[pop]
            if box.last == doll {
                box.removeLast()
                answer += 2
            } else {
                box.append(doll)
            }
            board_to_remove[pop] = 0
            board[row_to_change] = board_to_remove
        }
    }
    
    return answer
}