import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var y_cases: Set<[Int]> = []
    
    for i in 1...yellow {
        if yellow % i == 0 && i >= yellow / i {
            y_cases.insert([i, yellow / i])
        }
    }
    
    for c in y_cases {
        if (c[0] + 2) * (c[1] + 2) == brown + yellow { return [(c[0] + 2), (c[1] + 2)] }
    }
    
    return []
}

func test() {
    print(solution(10, 2), [4,3])
}

test()
