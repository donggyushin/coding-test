import Foundation

private func isShouldUpdate(scoville: [Int], K: Int) -> Bool {
    var result = false
    
    scoville.forEach { element in
        if element < K {
            result = true
        }
    }
    
    return result
}

private func update(scoville: [Int]) -> [Int] {
    var scoville = scoville
    scoville.sort()
    
    let first = scoville.removeFirst()
    let second = scoville.removeFirst()
    let new = first + (second * 2)
    scoville.insert(new, at: 0)
    
    return scoville
}

func solution(scoville: [Int], K: Int) -> Int {
    var result = 0
    var scoville = scoville
    
    while isShouldUpdate(scoville: scoville, K: K) == true {
        
        if scoville.count <= 1 {
            result = -1
            break
        }
        
        scoville = update(scoville: scoville)
        result += 1
    }
    
    return result
}

func test() {
    guard solution(scoville: [1, 2, 3, 9, 10, 12], K: 7) == 2 else { return print("test fail") }
    guard solution(scoville: [1, 2], K: 7) == -1 else { return print("test fail") }
    guard solution(scoville: [5, 5], K: 7) == 1 else { return print("test fail") }
    print("test success")
}

test()
