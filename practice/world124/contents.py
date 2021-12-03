def solution(n: int):
    answer = ''
    numbers = [4, 1, 2]

    def recursive(n: int):
        global answer
        result = int(n / 3)
        left = int(n % 3)
        value = str(numbers[left])
        answer = value + answer

        if value == 4:
            result -= 1

        if result > 0:
            recursive(result)

    recursive(n)
    return answer


def test():
    print(solution(4), 11)
    # print(solution(10), 41)


test()
