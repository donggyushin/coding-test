import Foundation


func solution(_ scoville: [Int], _ k: Int) -> Int {
    var answer = 0
    var scoville = scoville
    
    while scoville.count > 1 {
        scoville.sort()
        if scoville[0] >= k { break }
        let min1 = scoville.removeFirst()
        let min2 = scoville.removeFirst()
        let new = min1 + (min2 * 2)
        scoville.append(new)
        answer += 1
    }
    
    if (scoville[0]) < k { answer = -1 }
    
    return answer
}

func test() {
    print(solution([1, 2, 3, 9, 10, 12], 7), 2)
}

test()
