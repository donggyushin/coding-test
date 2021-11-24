import Foundation

func solution(_ lines:[String]) -> Int {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    let lines = lines.map({ $0.split(separator: " ") })
    let timeIntervals = lines.map({ $0[0..<2].joined(separator: " ") }).compactMap({ dateFormatter.date(from: $0) }).map({ Double($0.timeIntervalSince1970) })
    let timeIntervals_dimension = zip(timeIntervals, lines).map({ [($0 - (Double($1[2].replacingOccurrences(of: "s", with: "")) ?? 0)) + 0.001, $0] })
    var answer = 0
    
    func get_count(from: Double) -> Int {
        let to = from + 1
        // timeIntervals_dimension 중에 시작 시간이 to 보다 크거나, 끝나는 시간이 from 보다 작은 경우를 제외하고 갯수를 센다
        return timeIntervals_dimension.filter({ !($0[0] >= to || $0[1] < from) }).count
    }
    
    for item in timeIntervals_dimension {
        answer = max(answer, get_count(from: item[1]))
    }
    
    return answer
}