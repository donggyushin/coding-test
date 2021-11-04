import Foundation

func solution(_ jobs: [[Int]]) -> Int {
    var now = 0
    var jobs = jobs.sorted(by: { $0[1] < $1[1] })
    var averages: [Int] = []
    
    while jobs.isEmpty == false {
        if let available_job = jobs.filter({ $0[0] <= now }).first {
            if let index = jobs.firstIndex(of: available_job) {
                jobs.remove(at: index)
            }
            now += available_job[1]
            averages.append(now - available_job[0])
        } else {
            now += 1
        }
    }
    
    return averages.reduce(0, { $0 + $1 }) / averages.count
}

func test() {
    print(solution([[0, 3], [1, 9], [2, 6]]), 9)
}

test()
