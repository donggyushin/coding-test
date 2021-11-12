import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let answers1 = [1,2,3,4,5]
    let answers2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let answers3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var sums: [Int] = [0, 0, 0]
    
    answers.enumerated().forEach({
        
        if answers1[$0 % answers1.count] == $1 {
            sums[0] += 1
        }
        
        if answers2[$0 % answers2.count] == $1 {
            sums[1] += 1
        }
        
        if answers3[$0 % answers3.count] == $1 {
            sums[2] += 1
        }
    })
    return sums.enumerated().filter({ $1 == (sums.max() ?? 0) }).map({ $0.offset + 1 })
}

func test() {
    print(solution([1,2,3,4,5]), [1])
    print(solution([1,3,2,4,2]), [1,2,3])
}

test()
