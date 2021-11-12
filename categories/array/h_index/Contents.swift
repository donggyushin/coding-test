import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: { $0 > $1 })
    var h = citations.count
    
    while citations.filter({ $0 >= h }).count < h {
        h -= 1
    }
    
    return h
}

func test() {
    print(solution([3, 0, 6, 1, 5]), 3)
    print(solution([9, 7, 6, 2, 1]), 3)
}

test()
