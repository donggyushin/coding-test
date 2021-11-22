import Foundation

func func2(split_count: Int, s: String) -> Int {
    var s = s
    var answer = ""
    
    func recursive(cnt: Int, str_to_comp: String) -> String {
        let pop = String(s.prefix(str_to_comp.count))
        if pop == str_to_comp {
            s.removeFirst(str_to_comp.count)
            return recursive(cnt: cnt + 1, str_to_comp: str_to_comp)
        } else {
            if cnt > 1 {
                return "\(cnt)\(str_to_comp)"
            } else {
                return str_to_comp
            }
        }
    }
    
    while s.isEmpty == false {
        let str_to_comp = String(s.prefix(split_count))
        s.removeFirst(str_to_comp.count)
        answer.append(recursive(cnt: 1, str_to_comp: str_to_comp))
    }
    
    return answer.count
}

func solution(_ s:String) -> Int {
    var answer = s.count
    
    for i in 1..<(s.count/2) + 1 {
        answer = min(answer, func2(split_count: i, s: s))
    }
    
    return answer
}