import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {

    let _lost = lost.filter({!reserve.contains($0)}).sorted()
    let _reserve = reserve.filter({!lost.contains($0)}).sorted()
    var visited: [Bool] = _reserve.map({ _ in false })
    var answer = n - _lost.count
    
    _lost.forEach({ lost_item in
        for (i, reserve_item) in _reserve.enumerated() {
            let diff = (lost_item - reserve_item).magnitude
            if diff <= 1, visited[i] == false {
                visited[i] = true
                answer += 1
                break
            }
        }
    })
    
    return answer
}

func test() {
    print(solution(5, [4, 2], [3, 5]), 5)
}

test()
