import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var k = k
    var number = number.map({ String($0) })
    
    while k != 0 {
        var i = 0
        while i < number.count - 1 {
            if number[i] < number[i + 1] {
                break
            }
            i += 1
        }
        number.remove(at: i)
        k -= 1
    }
    
    return number.joined(separator: "")
}

func test() {
    print(solution("909", 1), "99")
    print(solution("990", 1), "99")
}

test()
