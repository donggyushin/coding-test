function solution(participant: string[], completion: string[]) {
    var answer = '';

    let participantHashMap = new Map<string, number>()

    participant.forEach(person => {
        if (participantHashMap.get(person)) {
            participantHashMap.set(person, participantHashMap.get(person) + 1)
        } else {
            participantHashMap.set(person, 1)
        }
    })

    completion.forEach(person => {

        if (participantHashMap.get(person)) {
            participantHashMap.set(person, participantHashMap.get(person) - 1)
        }
    })
    
    participantHashMap.forEach((value, key) => {
        if (value > 0) {
            answer = key
        }
    })

    return answer;
}

solution(["leo", "kiki", "eden"], ["eden", "kiki"])