import Foundation

func solution(_ s:String) -> Int {
    var s = s.replacingOccurrences(of: "one", with: "1")
    s = s.replacingOccurrences(of: "two", with: "2")
    s = s.replacingOccurrences(of: "three", with: "3")
    s = s.replacingOccurrences(of: "four", with: "4")
    s = s.replacingOccurrences(of: "five", with: "5")
    s = s.replacingOccurrences(of: "six", with: "6")
    s = s.replacingOccurrences(of: "seven", with: "7")
    s = s.replacingOccurrences(of: "eight", with: "8")
    s = s.replacingOccurrences(of: "nine", with: "9")
    s = s.replacingOccurrences(of: "zero", with: "0")
    return Int(s) ?? 0
}