def solution(routes: list[list[int]]):
    routes = sorted(routes, key=lambda x: x[1])
    answer = 0
    while routes.__len__() != 0:
        pop = routes.pop(0)
        routes = list(filter(lambda x: not(
            x[0] <= pop[1] and pop[1] <= x[1]), routes))
        answer += 1

    return answer


def test():
    print(solution([[-20, -15], [-14, -5], [-18, -13], [-5, -3]]), 2)


test()
