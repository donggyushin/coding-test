from typing import List


def isShouldUpdate(scoville: List[int], K: int) -> bool:
    result = False

    for item in scoville:
        if item < K:
            result = True
            break

    return result


def update(scoville: List[int]) -> List[int]:
    scoville.sort()
    first = scoville.pop(0)
    second = scoville.pop(0)
    new = first + (second * 2)
    scoville.insert(0, new)
    return scoville


def solution(scoville, K):
    answer = 0

    while isShouldUpdate(scoville, K):

        if scoville.__len__() <= 1:
            answer = -1
            break

        scoville = update(scoville)
        answer += 1

    return answer


def test():
    if solution([1, 2, 3, 9, 10, 12], 7) != 2:
        print("test fail")
        return
    if solution([1, 2], 7) != -1:
        print("test fail")
        return
    print("test success")


test()
