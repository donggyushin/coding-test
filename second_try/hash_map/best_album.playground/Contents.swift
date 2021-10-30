import Foundation


func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var result: [Int] = []
    var genre_index_play_hash_map: [String: [[Int]]] = [:]
    var genre_play_hash_map: [String: Int] = [:]
    
    for (g, p) in zip(genres, plays.enumerated()) {
        genre_index_play_hash_map[g] = ((genre_index_play_hash_map[g] ?? []) + [[p.offset, p.element]]).sorted(by: { $0[1] > $1[1] })
    }
    
    for (g, p) in zip(genres, plays) {
        genre_play_hash_map[g] = (genre_play_hash_map[g] ?? 0) + p
    }
    
    let sorted_genres = genre_play_hash_map.sorted(by: { $0.value > $1.value }).map({ $0.key })
    
    for g in sorted_genres {
        for (i, item) in (genre_index_play_hash_map[g] ?? []).enumerated() {
            if i > 1 { break }
            result.append(item[0])
        }
    }
    
    return result
}

func test() {
    print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]), [4, 1, 3, 0])
}

test()
