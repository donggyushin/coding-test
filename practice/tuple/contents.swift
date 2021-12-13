import Foundation

func solution(_ s:String) -> [Int] {
    var answer: [Int] = []
    s[s.index(s.startIndex, offsetBy: 2)..<s.index(s.endIndex, offsetBy: -2)].components(separatedBy: "},{").sorted(by: { $0.count < $1.count }).map({ $0.split(separator: ",").compactMap({Int($0)})}).forEach({$0.forEach({if answer.contains($0) == false {answer.append($0)}})})
    return answer
}