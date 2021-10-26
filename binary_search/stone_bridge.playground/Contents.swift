import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted()
    var left = 0
    var right = distance
    var answer = 0
    
    while left <= right {
        var count = 0
        let middle = (left + right) / 2
        var prev = 0
        
        rocks.forEach({
            if $0 - prev < middle {
                count += 1
            } else {
                prev = $0
            }
        })
        
        if distance - prev < middle {
            count += 1
        }
        
        if count > n {
            right = middle - 1
        } else {
            left = middle + 1
            answer = max(answer, middle)
        }
    }
    
    return answer
}

func test() {
    print(solution(25, [2, 14, 11, 21, 17], 2), 4)
}

test()
