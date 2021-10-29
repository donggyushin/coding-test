import Foundation

func solution(triangle: [[Int]]) -> Int {
    var triangle = triangle
    for (i, array) in triangle.enumerated() {
        if i == 0 { continue }
        for (j, _) in array.enumerated() {
            if j == 0 {
                triangle[i][j] += triangle[i - 1][j]
            } else if j == array.count - 1 {
                triangle[i][j] += triangle[i - 1].last ?? 0
            } else {
                triangle[i][j] += max(triangle[i - 1][j - 1], triangle[i - 1][j])
            }
        }
    }
    
    return triangle.last?.sorted().last ?? 0
}

func test() {
    print(solution(triangle: [[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]]), 30)
}

test()
