import Foundation

private func isH(citations: [Int], h: Int) -> Bool {
    var over_h: [Int] = []
    var citations = citations
    citations.sort(by: { $0 > $1 })
    
    while citations.count > 0 {
        if citations[0] >= h {
            over_h.append(citations.removeFirst())
        } else {
            break
        }
    }
    
    return over_h.count >= h
}

func solution(_ citations:[Int]) -> Int {
    var result = 0
    
    for (index, _) in citations.enumerated() {
        if isH(citations: citations, h: index + 1) { result = index + 1}
    }
    
    return result
}

func test() {
    print(solution([3, 0, 6, 1, 5])==3)
    print(solution([0, 0, 0, 0, 0])==0)
    print(solution([0])==0)
    print(solution([1])==1)
    print(solution([1, 0, 0, 0])==1)
}

test()
