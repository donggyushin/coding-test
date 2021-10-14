import Foundation

class Carpet {
    private var yellow: Int
    private var brown: Int
    
    init(yellow: Int, brown: Int) {
        self.yellow = yellow
        self.brown = brown
    }
    
    private func square_cases(tiles: Int) -> Set<[Int]> {
        var result: Set<[Int]> = []
        for i in 1..<tiles+1 {
            if tiles % i == 0 {
                result.insert([i, tiles / i].sorted(by: { $0 > $1 }))
            }
        }
        return result
    }
    
    func get_tile() -> [Int] {
        
        let carpet_cases = square_cases(tiles: yellow + brown)
        let yellow_cases = square_cases(tiles: yellow)
        
        for yellow in yellow_cases {
            for carpet in carpet_cases {
                if yellow[0] + 2 <= carpet[0], yellow[1] + 2 <= carpet[1] {
                    return carpet
                }
            }
        }
        
        return []
    }
}

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    return Carpet(yellow: yellow, brown: brown).get_tile()
}

func test() {
    print(solution(10, 2)==[4,3])
    print(solution(8, 1)==[3,3])
    print(solution(24, 24)==[8,6])
}

test()
