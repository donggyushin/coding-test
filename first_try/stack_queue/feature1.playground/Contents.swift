import Foundation

private func work(progresses:[Int], speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var progresses = progresses
    
    while (progresses[0] < 100) {
        
        for (index, progress) in progresses.enumerated() {
            let speed = speeds[index]
            let newValue = progress + speed
            progresses[index] = newValue
        }
        
    }
    result = progresses
    return result
}

private func release(progresses:[Int], speeds:[Int]) -> ([Int], [Int], Int) {
    var progresses = progresses
    var speeds = speeds
    var releaseNumber = 0
    while(progresses.count > 0) {
        if progresses[0] >= 100 {
            progresses.removeFirst()
            speeds.removeFirst()
            releaseNumber += 1            
        } else {
            break
        }
    }
    
    return (progresses, speeds, releaseNumber)
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    
    var progresses = progresses
    var speeds = speeds
    var resultElement: Int = 0
    
    while (progresses.count > 0) {
        let newProgress = work(progresses: progresses, speeds: speeds)
        (progresses, speeds, resultElement) = release(progresses: newProgress, speeds: speeds)
        result.append(resultElement)
    }
    
    return result
}

func test() {
    guard solution([93, 30, 55], [1, 30, 5]) == [2, 1] else { return print("test fail") }
    guard solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]) == [1, 3, 2]    else { return print("test fail") }
    print("test success")
}

test()
