from typing import List


def get_time(prices: List[int]):
    times = 0

    first_price = prices.pop(0)

    for price in prices:
        times += 1
        if first_price > price:
            break

    return prices, times


def solution(prices: List[int]) -> List[int]:
    answer = []

    while prices.__len__() > 0:
        time = 0
        prices, time = get_time(prices)
        answer.append(time)

    return answer


def test():
    if solution([1, 2, 3, 2, 3]) != [4, 3, 1, 1, 0]:
        return print("test fail")
    print("test success")


test()
