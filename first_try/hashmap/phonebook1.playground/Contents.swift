import UIKit

func solution(phone_book: [String]) -> Bool {
    
    var set = Set<String>()
    var result = true
    
    phone_book.forEach { element in
        set.insert(element)
    }
    
    phone_book.forEach { phone_number in
        var temp = ""
        phone_number.forEach { character in
            temp.append(character)
            if temp != phone_number, set.contains(temp) {
                result = false 
            }
        }
    }

    return result
}

func test() {
    guard solution(phone_book: ["119", "97674223", "1195524421"]) == false else { return print("test fail") }
    guard solution(phone_book: ["123","456","789"]) == true else { return print("test fail") }
    guard solution(phone_book: ["12","123","1235","567","88"]) == false else { return print("test fail") }
    print("test success")
}

test()
