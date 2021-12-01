import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    zip(a, b).map(*).reduce(0,+)
}