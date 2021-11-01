import Foundation

struct Node {
    let weight: Int
    var count = 0
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var answer = 0
    var completes: [Node] = []
    var on_bridge: [Node] = []
    var waiting: [Node] = truck_weights.map({ .init(weight: $0) })
    
    while completes.count != truck_weights.count {

        if let first_bridge = on_bridge.first {
            if first_bridge.count >= bridge_length {
                completes.append(on_bridge.removeFirst())
            }
        }
        
        if on_bridge.count < bridge_length  && on_bridge.reduce(0, { $0 + $1.weight }) + (waiting.first?.weight ?? 0) <= weight, waiting.first != nil {
            on_bridge.append(waiting.removeFirst())
        }
        
        on_bridge = on_bridge.map { node -> Node in
            var item = node
            item.count += 1
            return item
        }
        
        answer += 1
    }
    
    return answer
}

func test() {
    print(solution(2, 10, [7,4,5,6]), 8)
}

test()
