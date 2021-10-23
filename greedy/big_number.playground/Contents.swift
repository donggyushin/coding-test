import Foundation

func remove(number: [Int]) -> [Int] {
    var number = number
    let index_to_delete = number.enumerated().first(where: {
        if $0.element == 0 { return true }
        if $0.element == 9 { return false }
        if $0.offset + 1 == number.count { return false }
        return number[$0.offset+1] > $0.element
    }).map({$0.offset}) ?? number.count - 1
    number.remove(at: index_to_delete)
    return number
}

func solution(_ number:String, _ k:Int) -> String {
    var i = 0
    var number_array: [Int] = Array(number).compactMap({ Int(String($0))})
    while i < k {
        number_array = remove(number: number_array)
        i += 1
    }
    return number_array.reduce("", {"\($0)\($1)"})
}

func test() {
    print(solution("1924", 2), "94")
    print(solution("1231234", 3), "3234")
    print(solution("4177252841", 4), "775841")
}

test()
