import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var answer: [Int] = []
    
    let applicants = info.map({ $0.components(separatedBy: " ") })
    let queries = query.map({ $0.components(separatedBy: " and ")}).map { string_array -> [String] in
        var string_array = string_array
        let last = string_array.removeLast()
        string_array.append(contentsOf: last.components(separatedBy: " "))
        return string_array
    }
    
    for query in queries {
        var applicants = applicants
        (0...3).map { num in if query[num] != "-" {applicants = applicants.filter({ $0[num] == query[num] })}}
        applicants = applicants.filter({ (Int($0[4]) ?? 0) >= (Int(query[4]) ?? 0) })
        answer.append(applicants.count)
    }
    
    return answer
}