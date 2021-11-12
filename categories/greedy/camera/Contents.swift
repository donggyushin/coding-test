import Foundation

func solution(_ routes: [[Int]]) -> Int {
    var routes = routes.sorted(by: { $0[1] < $1[1] })
    var answer = 0
    while routes.isEmpty == false {
        let pop = routes.removeFirst()
        routes = routes.filter({ !($0[0] <= pop[1] && pop[1] <= $0[1]) })
        answer += 1
    }
    return answer
}

func test() {
    print(solution([[-20,-15], [-14,-5], [-18,-13], [-5,-3]]), 2)
}

test()
