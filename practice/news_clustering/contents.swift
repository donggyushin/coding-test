import Foundation

// str 의 다중 부분집합을 만든다.
func make_partial_array(str: String) -> [String] {
    let str = str.lowercased()
    var answer: [String] = []
    for i in 0..<str.count-1 {
        let test = String(str[str.index(str.startIndex, offsetBy: i)..<str.index(str.startIndex, offsetBy: i+2)])
        if test.reduce(true, { $0 && $1.isLetter }) { answer.append(test) }
    }
    return answer
}

func solution(_ str1:String, _ str2:String) -> Int {
    
    let str1_partial_array = make_partial_array(str: str1)
    var str2_partial_array = make_partial_array(str: str2)
    
    var intersection_count = 0
    var union_count = str1_partial_array.count + str2_partial_array.count
    for str in str1_partial_array {
        if str2_partial_array.contains(str) {
            intersection_count += 1
            str2_partial_array.remove(at: str2_partial_array.enumerated().first(where: { $1 == str }).map({ $0.offset }) ?? 0)
        }
    }
    
    union_count = union_count - intersection_count
    if union_count == 0 { return 65536 }
    
    return Int(Float(intersection_count) / Float(union_count) * Float(65536))
}