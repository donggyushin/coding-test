import Foundation

func solution(_ participant: [String], _ completion:[String]) -> String {
    
    var hash_map: [String: Int] = [:]
    participant.forEach({
        hash_map[$0] = (hash_map[$0] ?? 0) + 1
    })
    
    completion.forEach({
        hash_map[$0] = (hash_map[$0] ?? 0) - 1
    })
    
    return hash_map.first(where: { $0.value >= 1 }).map({ $0.key }) ?? ""
}

func test() {
    print(solution(["leo", "kiki", "eden"], ["eden", "kiki"]), "leo")
    print(solution(["marina", "josipa", "nikola", "vinko", "filipa"], ["josipa", "filipa", "marina", "nikola"]), "vinko")
    print(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"]), "mislav")
}

test()
