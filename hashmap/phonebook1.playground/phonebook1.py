from typing import List


def solution(phone_book: List[str]):
    answer = True
    phone_book.sort()

    print(phone_book)

    for (index1, phone1) in enumerate(phone_book):
        for (index2, phone2) in enumerate(phone_book):
            if index1 < index2:
                if phone2.startswith(phone1):
                    answer = False

    return answer


solution(["119", "97674223", "1195524421"])
