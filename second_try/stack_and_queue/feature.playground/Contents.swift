import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answers: [Int] = []
    var progresses = progresses
    var speeds = speeds
    
    while progresses.isEmpty == false {
        
        while (progresses.first ?? 0) < 100 {
            progresses = zip(progresses, speeds).map({ $0 + $1 })
        }
        
        var answer = 0
        
        while (progresses.first ?? 0) >= 100 {
            progresses.removeFirst()
            speeds.removeFirst()
            answer += 1
        }
        
        answers.append(answer)
    }
    
    return answers
}

func test() {
    print(solution([93, 30, 55], [1, 30, 5]), [2, 1])
}

test()
