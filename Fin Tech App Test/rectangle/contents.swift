import Foundation

func solution(_ v: [[Int]]) -> [Int] {
    var x_hash_map: [Int: Int] = [:]
    var y_hash_map: [Int: Int] = [:]
    v.forEach({
        if let value = x_hash_map[$0[0]] {
            x_hash_map[$0[0]] = value + 1
        } else {
            x_hash_map[$0[0]] = 1
        }
        
        if let value = y_hash_map[$0[1]] {
            y_hash_map[$0[1]] = value + 1
        } else {
            y_hash_map[$0[1]] = 1
        }
    })
    
    return [x_hash_map.first(where: { $0.value == 1 }).map({ $0.key }) ?? 0, y_hash_map.first(where: { $0.value == 1 }).map({ $0.key }) ?? 0]
}

