import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    zip(absolutes, signs).map { (number, sign) -> Int in
        return sign ? number : -number
    }.reduce(0, { $0 + $1 })
}