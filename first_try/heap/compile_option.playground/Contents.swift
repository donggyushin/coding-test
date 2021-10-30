import Foundation

struct Job {
    let requestTime: Int
    var startTime: Int = 0
    let workTime: Int
    
    func getTime() -> Int {
        return startTime + workTime - requestTime
    }
    
    mutating func setStartTime(startTime: Int) {
        self.startTime = startTime
    }
    
    func isAvailable(current_time: Int) -> Bool {
        return current_time >= requestTime
    }
}

enum SortType {
    case WORK_TIME
    case REQUEST_TIME
}

private func generatedJobs(jobs: [[Int]]) -> [Job] {
    var result: [Job] = []
    jobs.forEach { job in
        result.append(.init(requestTime: job[0], workTime: job[1]))
    }
    return result
}

private func sort_jobs(jobs: [Job], type: SortType) -> [Job] {
    var jobs = jobs
    switch type {
    case .REQUEST_TIME:
        jobs = jobs.sorted(by: { $0.requestTime < $1.requestTime })
    case .WORK_TIME:
        jobs = jobs.sorted(by: { $0.workTime < $1.workTime })
    }
    return jobs
}

private func do_work(jobs: [Job], current_time: Int) -> ([Job], Int, Job) {
    var jobs = sort_jobs(jobs: jobs, type: .WORK_TIME)
    var current_time = current_time
    var job = jobs[0]
    
    if job.isAvailable(current_time: current_time) {
        job = jobs.removeFirst()
        job.setStartTime(startTime: current_time)
        for _ in 0..<job.workTime {
            current_time += 1
        }
        
    } else {
        jobs = sort_jobs(jobs: jobs, type: .REQUEST_TIME)
        
        job = jobs[0]
        
        if job.isAvailable(current_time: current_time) {
            // 바로 작업이 가능한 경우
            // 가능한 가장 짧은 작업시간의 job을 찾는다.
            var index_i_want = 0
            var temp_work_time = job.workTime
            
            for (index, element) in jobs.enumerated() {
                if element.workTime < temp_work_time, element.isAvailable(current_time: current_time) {
                    index_i_want = index
                    temp_work_time = element.workTime
                }
            }
            
            job = jobs.remove(at: index_i_want)
            job.setStartTime(startTime: current_time)
            for _ in 0..<job.workTime {
                current_time += 1
            }
            
        } else {
            // 바로 작업이 가능하지 않은 경우
            while job.isAvailable(current_time: current_time) == false {
                current_time += 1
            }
            
            job = jobs.removeFirst()
            job.setStartTime(startTime: current_time)
            for _ in 0..<job.workTime {
                current_time += 1
            }
        }
    }
    
    return (jobs, current_time, job)
}

private func get_average(jobs: [Job]) -> Int {
    var total_time = 0
    jobs.forEach { job in
        total_time += job.getTime()
    }
    
    return Int(total_time / jobs.count)
}

func solution(_ jobs:[[Int]]) -> Int {
    var current_time = 0
    var jobs = generatedJobs(jobs: jobs)
    var complete_jobs: [Job] = []
    var job = jobs[0]
    
    while jobs.count != 0 {
         (jobs, current_time, job) = do_work(jobs: jobs, current_time: current_time)
        complete_jobs.append(job)
    }
    
    return get_average(jobs: complete_jobs)
}

func test() {
    guard solution([[0, 3], [1, 9], [2, 6]]) == 9 else { return print("test fail ")}
    guard solution([[24, 10], [28, 39], [43, 20], [37, 5], [47, 22], [20, 47], [15, 34], [15, 2], [35, 43], [26, 1]]) == 72 else { return print("test fail ")}
    guard solution([[0, 3], [0, 2], [1, 9], [2, 6]]) == 8 else { return print("test fail ")}
    guard solution([[0, 9], [0, 4], [0, 5], [0, 7], [0, 3]]) == 13 else { return print("test fail ")}
    guard solution([[0, 3], [4, 6]]) == 4 else { return print("test fail") }
    guard solution([[0, 3], [4, 4], [5, 3], [4, 1]]) == 3 else { return print("test fail") }
    guard solution([[0, 3], [1, 9], [500, 6]]) == 6 else { return print("test fail") }
    guard solution([[1, 9], [1, 4], [1, 5], [1, 7], [1, 3]]) == 13 else { return print("test fail") }
    guard solution([[0, 5], [1, 4], [6, 1], [7, 1]]) == 5 else { return print("test fail") }
    print(solution([[24, 10], [18, 39], [34, 20], [37, 5], [47, 22], [20, 47], [15, 34], [15, 2], [35, 43], [26, 1]]), 74)
    print(solution([[24, 10], [28, 39], [43, 20], [37, 5], [47, 22], [20, 47], [15, 34], [15, 2], [35, 43], [26, 1]]), 72)
    print(solution([[0, 10], [4, 10], [15, 2], [5, 11]]), 15)
    print(solution([[0, 10], [2, 10], [9, 10], [15, 2]]), 14)
    print(solution([[0, 10], [2, 12], [9, 19], [15, 17]]), 25)
    print(solution([[0, 3], [1, 9], [2, 6]]), 9)
    print(solution([[0, 1]]), 1)
    print(solution([[1000, 1000]]), 1000)
    print(solution([[0, 1], [0, 1], [0, 1]]), 2)
    print(solution([[0, 1], [0, 1], [0, 1], [0, 1]]), 2)
    print(solution([[0, 1], [1000, 1000]]), 500)
    print(solution([[100, 100], [1000, 1000]]), 500)
    print(solution([[10, 10], [30, 10], [50, 2], [51, 2]]), 6)
    print(solution([[0, 3], [1, 9], [2, 6], [30, 3]]), 7)
    
}

test()
