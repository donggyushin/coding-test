import Foundation

func solution(_ phone_book: [String]) -> Bool {
    let phone_book = phone_book.sorted()
    for (p1, p2) in zip(phone_book, phone_book[1..<phone_book.count]) {
        if p2.starts(with: p1) {
            return false
        }
    }
    
    return true
}
