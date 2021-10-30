import Foundation

func solution(_ phone_book: [String]) -> Bool {
    var answer = true
    
    func dfs(left: String, rights: [String]) {
        if rights.isEmpty { return }
        var rights = rights
        let right = rights.removeFirst()
        if left.contains(right) || right.contains(left) { return answer = false }
        else { dfs(left: left, rights: rights) }
    }
    
    var phone_book = phone_book
    
    while phone_book.isEmpty == false {
        if answer == false { return false }
        let left = phone_book.removeFirst()
        dfs(left: left, rights: phone_book)
    }
    
    return true
}

func test() {
    print(solution(["119", "97674223", "1195524421"]), false)
    print(solution(["123","456","789"]), true)
    print(solution(["12","123","1235","567","88"]), false)
}

test()
