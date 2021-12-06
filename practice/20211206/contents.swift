import Foundation

func solution(_ s:String) -> Int{
    var left: String = ""
    var right: String = s
    
    while right.isEmpty == false {
        let pop = right.removeFirst()
        if let last = left.last {
            if last == pop {
                left.removeLast()
            } else {
                left.append(pop)
            }
        } else {
            left.append(pop)
        }
    }
    return left.isEmpty ? 1 : 0
}