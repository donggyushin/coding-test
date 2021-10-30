from typing import List


def solution(participant: List[str], completion: List[str]):
    answer = ''
    answer = ''
    temp = 0
    dic = {}
    for part in participant:
        dic[hash(part)] = part
        temp += int(hash(part))
    for com in completion:
        temp -= hash(com)

    answer = dic[temp]

    return answer


def test():
    print(solution(["leo", "kiki", "eden"], ["eden", "kiki"]))


test()
