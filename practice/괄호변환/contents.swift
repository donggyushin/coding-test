import Foundation

func validate(w: String) -> Bool {
    var count = 0
    
    for char in w {
        if char == "(" { count += 1 }
        else { count -= 1 }
        if count < 0 { return false }
    }
    
    return true
}

func setUV(w: String) -> (String, String) {
    
    var count = 0
    var index = 0
    for (i, char) in w.enumerated() {
        if char == "(" { count += 1 }
        else { count -= 1 }
        
        if count == 0 {
            index = i + 1
            break
        }
    }
    
    let u = String(w[w.startIndex..<w.index(w.startIndex, offsetBy: index)])
    let v = String(w[w.index(w.startIndex, offsetBy: index)..<w.endIndex])
    
    return (u, v)
}

func reverse(s: String) -> String {
    var answer = ""
    
    for c in s {
        if c == "(" { answer.append(")") }
        else { answer.append("(") }
    }
    
    return answer
}

func solution(_ p:String) -> String {
    
    if p.isEmpty { return "" }
    var (u, v) = setUV(w: p)
    if validate(w: u) {
        return u + solution(v)
    } else {
        v = solution(v)
        if u.isEmpty == false {
            u.removeFirst()
        }
        
        if u.isEmpty == false {
            u.removeLast()
        }
        
        u = reverse(s: u)
        
        var answer = ""
        answer.append("(")
        answer += v
        answer.append(")")
        answer += u
        return answer
    }
}