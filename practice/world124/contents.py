answer = ''


def solution(n: int):

    numbers = [4, 1, 2]

    def recursive(n: int):
        global answer
        result = int(n / 3)

        left = int(n % 3)
        value = str(numbers[left])
        answer = value + answer

        if value == '4':

            result -= 1

        if result >= 1:
            recursive(result)

    recursive(n)
    return answer
