import Foundation

struct SongType {
    let id: Int
    let plays: Int
}

struct ResultType {
    let genre: String
    var songs: [SongType]
    
    func getTotalPlays() -> Int {
        var result = 0
        
        songs.forEach { song in
            result += song.plays
        }
        return result
    }
    
    mutating func reArrangeSongs() {
        var songs = self.songs
        songs.sort(by: {$0.id < $1.id})
        songs.sort(by:{ $0.plays > $1.plays })
        self.songs = songs
    }
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var result: [Int] = []
    let hashMap = generateHashMaps(genres: genres, plays: plays)
    let results = generateResults(hashMap: hashMap)
    
    results.forEach { resultType in
        let maxTimes = 1
        
        for (index, value) in resultType.songs.enumerated() {
            if index > maxTimes { break }
            result.append(value.id)
        }
    }
    
    return result
}

private func generateResults(hashMap: [String: [Int: Int]]) -> [ResultType] {
    var results: [ResultType] = []
    
    hashMap.forEach { (key, value) in
        var songs: [SongType] = []
        value.forEach { (songId, plays) in
            let song: SongType = .init(id: songId, plays: plays)
            songs.append(song)
        }
        var result: ResultType = .init(genre: key, songs: songs)
        result.reArrangeSongs()
        results.append(result)
    }
    
    results.sort(by: {$0.getTotalPlays() > $1.getTotalPlays()})
    
    return results
}

private func generateHashMaps(genres:[String], plays:[Int]) -> [String: [Int: Int]] {
    var hashMap = [String: [Int: Int]]()
    
    for (index, genre) in genres.enumerated() {
        
        if hashMap[genre] == nil {
            hashMap[genre] = [index: plays[index]]
        } else {
            hashMap[genre]?[index] = plays[index]
        }
    }
    
    return hashMap
}

func test() {
    guard solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]) == [4, 1, 3, 0] else { return print("test fail") }
    guard solution(["classic", "pop"], [500, 600]) == [1, 0] else { return print("test fail") }
    guard solution(["classic", "pop", "classic", "classic", "classic"], [100, 1500, 300, 1000, 300]) == [3, 2, 1] else { return print("test fail") }
    print("test success")
}

test()
