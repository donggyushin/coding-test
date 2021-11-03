from typing import List


def solution(scoville: List[int], K: int):
    answer = 0
    while scoville.__len__() > 1:
        scoville.sort()
        if scoville[0] >= K:
            break
        min1 = scoville.pop(0)
        min2 = scoville.pop(0)
        new = min1 + (min2 * 2)
        scoville.append(new)
        answer += 1

    if scoville[0] < K:
        answer = - 1

    return answer


def test():
    print(solution([1, 2, 3, 9, 10, 12], 7), 2)


test()
