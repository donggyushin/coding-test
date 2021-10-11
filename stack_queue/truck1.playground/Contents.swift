import Foundation

struct Truck {
    let weight: Int
    var times: Int = 0
}

private func generate_trucks_before(truck_weights: [Int]) -> [Truck] {
    var trucks: [Truck] = []
    
    truck_weights.forEach { weight in
        trucks.append(.init(weight: weight))
    }
    
    return trucks
}

private func time_passed(bridge_length: Int, endurable_weight: Int, trucks_before: [Truck], trucks_in_bridge: [Truck], trucks_after: [Truck]) -> ([Truck], [Truck], [Truck]) {
    var trucks_before = trucks_before
    var trucks_in_bridge = trucks_in_bridge
    var trucks_after = trucks_after
    
    trucks_in_bridge = trucks_in_bridge.map({ truck in
        var truck = truck
        truck.times += 1
        return truck
    })
    
    if let first_truck_in_bridge = trucks_in_bridge.first, first_truck_in_bridge.times >= bridge_length {
        if trucks_in_bridge.count > 0 {
            trucks_after.append(trucks_in_bridge.removeFirst())
        }
    }
    
    if let new_truck = trucks_before.first, canPass(trucks_in_bridge: trucks_in_bridge, new_truck: new_truck, endurable_weight: endurable_weight, bridge_length: bridge_length) {
        if trucks_before.count > 0 {
            trucks_in_bridge.append(trucks_before.removeFirst())
        }
    }
    
    return (trucks_before, trucks_in_bridge, trucks_after)
}

private func canPass(trucks_in_bridge: [Truck], new_truck: Truck, endurable_weight: Int, bridge_length: Int) -> Bool {
    var canPass = false
    var current_weight: Int = 0
    
    if trucks_in_bridge.count >= bridge_length { return false }
    trucks_in_bridge.forEach { truck in
        current_weight += truck.weight
    }
    if current_weight + new_truck.weight <= endurable_weight {
        canPass = true
    }
    return canPass
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    
    var trucks_before: [Truck] = generate_trucks_before(truck_weights: truck_weights)
    var trucks_in_bridge: [Truck] = []
    var trucks_after: [Truck] = []
    
    while trucks_after.count != truck_weights.count {
        (trucks_before, trucks_in_bridge, trucks_after) = time_passed(bridge_length: bridge_length, endurable_weight: weight, trucks_before: trucks_before, trucks_in_bridge: trucks_in_bridge, trucks_after: trucks_after)
        time += 1
    }
    
    return time
}



func test() {
    guard solution(2, 10, [7,4,5,6]) == 8 else { return print("test fail") }
    guard solution(100, 100, [10]) == 101 else { return print("test fail") }
    guard solution(100, 100, [10,10,10,10,10,10,10,10,10,10]) == 110 else { return print("test fail") }
    print("test success")
}

test()
