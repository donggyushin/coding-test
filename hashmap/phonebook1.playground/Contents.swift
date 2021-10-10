import UIKit

func solution(phone_book: [String]) -> Bool {
    
    var phone_book = phone_book
    phone_book.sort()
    for (i, phone1) in phone_book.enumerated() {
        for (j, phone2) in phone_book.enumerated() {
            if i < j {
                if phone2.contains(phone1) { return false }
            }
        }
    }
    return true
}

func test() {
    guard solution(phone_book: ["119", "97674223", "1195524421"]) == false else { return print("test fail") }
    guard solution(phone_book: ["123","456","789"]) == true else { return print("test fail") }
    guard solution(phone_book: ["12","123","1235","567","88"]) == false else { return print("test fail") }
    print("test success")
}

test()
