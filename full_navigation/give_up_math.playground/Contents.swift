import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let answers1 = [1,2,3,4,5]
    let answers2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let answers3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var answers1_sum = 0
    var answers2_sum = 0
    var answers3_sum = 0
    
    answers.enumerated().map({
        if answers1[($0 % answers1.count)] == $1 {
            answers1_sum += 1
        }
        if answers2[($0 % answers2.count)] == $1 {
            answers2_sum += 1
        }
        if answers3[($0 % answers3.count)] == $1 {
            answers3_sum += 1
        }
    })
    
    let biggest_number = (answers1_sum > answers2_sum ? answers1_sum : answers2_sum) > answers3_sum ?  (answers1_sum > answers2_sum ? answers1_sum : answers2_sum) : answers3_sum
    
    var result: [Int] = []
    if answers1_sum == biggest_number {
        result.append(1)
    }
    
    if answers2_sum == biggest_number {
        result.append(2)
    }
    
    if answers3_sum == biggest_number {
        result.append(3)
    }
    
    return result
}

func test() {
    print(solution([1,2,3,4,5])==[1])
    print(solution([1,3,2,4,2])==[1,2,3])
}

test()
