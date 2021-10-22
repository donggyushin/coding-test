import Foundation

class JoyStick {
    
    enum Direction {
        case LEFT
        case RIGHT
    }
    
    private let name: String
    private let alphabets: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    private let number_array: [Int]
    private var cases: [Int] = []
    
    init(name: String) {
        self.name = name
        self.number_array = Array(name).map({if $0 == "A" {return 0 } else {return 1}})
        
        start_right(number_array: number_array, i: 0, answer: 0, direction: nil)
        start_left(number_array: number_array, i: 0, answer: 0, direction: nil)
    }
    
    func get_answer() -> Int {
        return alphabet_count() + (cases.sorted().first ?? 0)
    }
    
    private func alphabet_count() -> Int {
        return Array(name).compactMap({ alphabets.firstIndex(of: $0)}).map({ if $0 > 13 { return 26 - $0 } else { return $0 }}).reduce(0, { $0 + $1 })
    }
    
    private func start_left(number_array: [Int], i: Int, answer: Int, direction: Direction?) {
        var number_array = number_array
        number_array[i] = 0
        if number_array.reduce(0, { $0 + $1 }) == 0 {return self.cases.append(answer)}
        
        let next_i = (i + 1) < number_array.count ? (i + 1) : 0
        let prev_i = (i - 1) > -1 ? (i - 1) : number_array.count - 1
        
        if let direction = direction {
            start_right(number_array: number_array, i: next_i, answer: answer + 1, direction: direction)
        }else if number_array[next_i] == 0 {
            start_right(number_array: number_array, i: next_i, answer: answer + 1, direction: .RIGHT)
        } else {
            start_right(number_array: number_array, i: prev_i, answer: answer + 1, direction: nil)
        }
    }
    
    private func start_right(number_array: [Int], i: Int, answer: Int, direction: Direction?) {
        var number_array = number_array
        number_array[i] = 0
        if number_array.reduce(0, { $0 + $1 }) == 0 {return self.cases.append(answer)}
        
        let next_i = (i + 1) < number_array.count ? (i + 1) : 0
        let prev_i = (i - 1) > -1 ? (i - 1) : number_array.count - 1
        
        if let direction = direction {
            start_right(number_array: number_array, i: prev_i, answer: answer + 1, direction: direction)
        }else if number_array[next_i] == 0 {
            start_right(number_array: number_array, i: prev_i, answer: answer + 1, direction: .LEFT)
        } else {
            start_right(number_array: number_array, i: next_i, answer: answer + 1, direction: nil)
        }
    }
}

func solution(_ name:String) -> Int {
    return JoyStick(name: name).get_answer()
}

func test() {
    print(solution("JEROEN"), 56)
    print(solution("JAN"), 23)
    print(solution("ZZAAAZZ"), 8)
}

test()
