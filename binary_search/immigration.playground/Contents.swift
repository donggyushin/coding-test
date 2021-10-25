import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.map({Int64($0)})
    var big_time = (times.sorted().last ?? 0) * Int64(n)
    var small_time: Int64 = 0
    var current_time: Int64 = big_time
    var answers: [Int64] = []
    
    var sum: Int64 = 0
    
    while big_time > small_time + 1 {
        sum = times.reduce(0, { $0 + (current_time / $1) })

        if sum >= n {
            answers.append(current_time)
            big_time = current_time
            current_time = (small_time + current_time) / 2
        } else {
            small_time = current_time
            current_time = (current_time + big_time) / 2
        }
    }
    
    return answers.sorted().first ?? 0
}

func test() {
    print(solution(6, [7, 10]), 28)
    print(solution(3, [1, 1, 1]), 1)
    print(solution(3, [1, 2, 3]), 2)
    print(solution(2, [1, 2]), 2)
}

test()
