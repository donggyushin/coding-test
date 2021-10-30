import Foundation

func arrangeClothes(clothes:[[String]]) -> [String: [String]] {

    var dict: [String: [String]] = [:]
    clothes.forEach { item in
        let value = item[0]
        let key = item[1]

        if let existClothes = dict[key] {
            if !existClothes.contains(value) {
                dict[key] = existClothes + [value]
            }
        } else {
            dict[key] = [value]
        }
    }
    return dict
}

func solution(_ clothes:[[String]]) -> Int {

    var result = 1
    let arranged = arrangeClothes(clothes: clothes)
    
    arranged.forEach { (key, value) in
        result *= value.count + 1
    }
    
    result -= 1
    
    return result
}

func test() {
    guard solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]) == 5 else { return print("test fail") }
    guard solution([["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]]) == 3 else { return print("test fail") }
    print("test success")
}

test()
