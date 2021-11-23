import Foundation

func solution(_ record:[String]) -> [String] {
    var user: [String: String] = [:]
    
    record.forEach({
        let commands = $0.split(separator: " ")
        if commands[0] == "Enter" || commands[0] == "Change" {
            user[String(commands[1])] = String(commands[2])
        }
    })
    
    return record.map { command -> String? in
        let commands = command.split(separator: " ")
        if commands[0] == "Enter" {
            return "\(user[String(commands[1])] ?? "")님이 들어왔습니다."
        } else if commands[0] == "Leave" {
            return "\(user[String(commands[1])] ?? "")님이 나갔습니다."
        }
        return nil
    }.compactMap({ $0 })
}