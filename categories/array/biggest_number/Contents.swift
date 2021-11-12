import Foundation

func solution(_ numbers:[Int]) -> String {
    let numbers = numbers.map({ String($0) }).sorted(by: { $0 + $1 > $1 + $0 })
    return numbers[0] == "0" ? "0" : numbers.joined(separator: "")
}