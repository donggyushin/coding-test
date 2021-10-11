import Foundation

private func get_time(prices: [Int]) -> ([Int], Int) {
    var times = 0
    var prices = prices
    
    let first_price = prices.removeFirst()
    
    for price in prices {
        times += 1
        if first_price > price { break }
    }
    
    return (prices, times)
}

func solution(prices: [Int]) -> [Int] {
    var result: [Int] = []
    var prices = prices
    while prices.count > 0 {
        var time = 0
        (prices, time) = get_time(prices: prices)
        result.append(time)
    }
    
    return result
}

func test() {
    guard solution(prices: [1, 2, 3, 2, 3]) == [4, 3, 1, 1, 0] else { return print("test fail") }
    print("test success")
}

test()
