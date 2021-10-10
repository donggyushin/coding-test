function solution(participant, completion) {
    var answer = '';
    var participantHashMap = new Map();
    participant.forEach(function (person) {
        if (participantHashMap.get(person)) {
            participantHashMap.set(person, participantHashMap.get(person) + 1);
        }
        else {
            participantHashMap.set(person, 1);
        }
    });
    completion.forEach(function (person) {
        if (participantHashMap.get(person)) {
            participantHashMap.set(person, participantHashMap.get(person) - 1);
        }
    });
    participantHashMap.forEach(function (value, key) {
        if (value > 0) {
            answer = key;
        }
    });
    return answer;
}
solution(["leo", "kiki", "eden"], ["eden", "kiki"]);
