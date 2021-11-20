import Foundation

func solution(_ new_id:String) -> String {
    
    let allowed_characters: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_", "."]
    //    1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    //    2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    var new_id = new_id.lowercased().filter({ allowed_characters.contains($0) }).map { $0 }
    
//    3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    var new_id_removed_duplicated_dots: [String.Element] = []
    while new_id.isEmpty == false {
        let pop = new_id.removeFirst()
        if !(new_id_removed_duplicated_dots.last == "." && pop == ".") {
            new_id_removed_duplicated_dots.append(pop)
        }
    }
    
//    4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    while true {
        if new_id_removed_duplicated_dots.first == "." {
            new_id_removed_duplicated_dots.removeFirst()
        } else if new_id_removed_duplicated_dots.last == "." {
            new_id_removed_duplicated_dots.removeLast()
        } else { break }
    }
//    5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    if new_id_removed_duplicated_dots.isEmpty { new_id_removed_duplicated_dots.append("a") }
//    6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
//         만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    if new_id_removed_duplicated_dots.count >= 16 {
        new_id_removed_duplicated_dots = Array(new_id_removed_duplicated_dots[0..<15])
    }
    if new_id_removed_duplicated_dots.first == "." {
        new_id_removed_duplicated_dots.removeFirst()
    }
    if new_id_removed_duplicated_dots.last == "." {
        new_id_removed_duplicated_dots.removeLast()
    }
//    7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    while new_id_removed_duplicated_dots.count <= 2 {
        if let last_char = new_id_removed_duplicated_dots.last {
            new_id_removed_duplicated_dots.append(last_char)
        }
    }
    
    var answer = ""
    new_id_removed_duplicated_dots.forEach({ answer.append($0) })
    
    return answer
}