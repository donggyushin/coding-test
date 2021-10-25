import Foundation

func solution(_ routes: [[Int]]) -> Int {
    let routes = routes.sorted(by: { $0[1] < $1[1] })
    var checked = routes.map({ _ in false })
    var answer = 0
    
    func trace() {
        guard let first_index = checked.enumerated().first(where: { $0.element == false }).map({ $0.offset }) else { return }
        let camera = routes[first_index][1]
        routes.enumerated().forEach({if $0.element[0] <= camera && camera <= $0.element[1] { checked[$0.offset] = true }})
    }
    
    // checked가 모두 완료될때까지 돈다
    while !checked.reduce(true, { $0 && $1 }) {
        trace()
        answer += 1
    }
    return answer
}

func test() {
    print(solution([[-20,-15], [-14,-5], [-18,-13], [-5,-3]]), 2)
    print(solution([[0, 0]]), 1)
    print(solution([[0, 1], [0, 1], [1, 2]]), 1)
    print(solution([[-20, 15], [-20, -15], [-14, -5], [-18, -13], [-5, -3]]), 2)
}

test()
