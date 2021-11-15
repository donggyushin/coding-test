import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    
    var courses: [[String]] = []
    let visited = tickets.map { _ in false }
    
    func dfs(i: Int, visited: [Bool], course: [String]) {
        var visited = visited
        var course = course
        visited[i] = true
        course.append(tickets[i][1])
        
        if visited.reduce(true, { $0 && $1 }) { return courses.append(course) }
        
        tickets.enumerated().filter { visited[$0] == false && tickets[i][1] == $1[0] }.forEach { dfs(i: $0.offset, visited: visited, course: course) }
    }
    
    tickets.enumerated().filter { $1[0] == "ICN" }.forEach { dfs(i: $0, visited: visited, course: [$1[0]]) }
    
    courses.sort {
        for (c1, c2) in zip($0, $1) {
            if c1 > c2 {
                return false
            } else if c1 < c2 {
                return true
            }
        }
        return false
    }
    
    return courses.first ?? []
}