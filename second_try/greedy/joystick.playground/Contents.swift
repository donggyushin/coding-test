import Foundation

func solution(_ name:String) -> Int {
    let alphabets: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var name_array = name.map({ $0 })
    var count = 0
    
    var i = 0
    
    while true {
        
        if let index = alphabets.firstIndex(of: name_array[i]) {
            if index > 13 {
                count += alphabets.count - index
            } else {
                count += index
            }
        }
        name_array[i] = "A"
        if name_array.filter({ $0 != "A" }).count == 0 { break }
        
        var right_count = 0
        var left_count = 0
        
        func right_func(j: Int) {
            right_count += 1
            var j = j + 1
            if j >= name_array.count {
                j = 0
            }
            if name_array[j] != "A" { return }
            right_func(j: j)
        }
        
        func left_func(j: Int) {
            left_count += 1
            var j = j - 1
            if j < 0 {
                j = name_array.count - 1
            }
            if name_array[j] != "A" { return }
            left_func(j: j)
        }
        
        right_func(j: i)
        left_func(j: i)
        
        if right_count <= left_count {
            i += 1
            if i >= name_array.count {
                i = 0
            }
        } else {
            i -= 1
            if i < 0 {
                i = name_array.count - 1
            }
        }
        count += 1
    }
    
    return count
}
