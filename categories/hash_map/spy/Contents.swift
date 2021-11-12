import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var result = 1
    var hash_map: [String: Int] = [:]
    clothes.forEach({
        hash_map[$0.last ?? ""] = (hash_map[$0.last ?? ""] ?? 0) + 1
    })
    hash_map.forEach({
        result *= $0.value + 1
    })
    result -= 1
    return result
}

func test() {
    print(solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]), 5)
}

test()
