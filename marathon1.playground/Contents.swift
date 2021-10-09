import UIKit

func solution(participant: [String], completion: [String]) -> String {
    var answer = ""
    var hashMap: [String: Int] = [:]
    
    for person in participant {
        if let value = hashMap[person] {
            hashMap[person] = value + 1
        } else {
            hashMap[person] = 1
        }
    }
    
    for person in completion {
        if let value = hashMap[person] {
            hashMap[person] = value - 1
        }
    }
    
    for (key, value) in hashMap {
        if value > 0 {
            answer = key
        }
    }
    
    return answer
}

func testMarathon() {
    
    guard solution(participant: ["leo", "kiki", "eden"], completion: ["eden", "kiki"]) == "leo" else { return print("test fail") }
    guard solution(participant: ["marina", "josipa", "nikola", "vinko", "filipa"], completion: ["josipa", "filipa", "marina", "nikola"]) == "vinko" else { return print("test fail") }
    guard solution(participant: ["mislav", "stanko", "mislav", "ana"], completion: ["stanko", "ana", "mislav"]) == "mislav" else { return print("test fail") }
    print("test success")
}

testMarathon()
