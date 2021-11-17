import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted()
    var left = 0
    var right = distance
    var answer = 0
    
    while true {
        let min_distance = (left + right) / 2
        if min_distance <= left { break }
        var prev = 0
        var number_of_removed_rocks = 0
        rocks.forEach({
            if $0 - prev < min_distance {
                number_of_removed_rocks += 1
            } else {
                prev = $0
            }
        })
        if distance - prev < min_distance {
            number_of_removed_rocks += 1
        }
        if number_of_removed_rocks > n {
            right = min_distance
        } else {
            left = min_distance
            answer = max(answer, min_distance)
        }
    }
    
    return answer
}