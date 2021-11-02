import Foundation

func solution(_ prices: [Int]) -> [Int] {
    var answer: [Int] = prices.map({ _ in 0 })
    
    for i in 0..<prices.count {
        for j in i+1..<prices.count {
            answer[i] += 1
            if prices[i] > prices[j] { break }
        }
    }
    
    return answer
}

func test() {
    print(solution([1, 2, 3, 2, 3]), [4, 3, 1, 1, 0])
}

test()
