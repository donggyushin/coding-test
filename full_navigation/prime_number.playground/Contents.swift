import Foundation



class AllCaseNumber {
    private var all_case_number: Set<Int> = []
    
    func set_all_case_number(now: [String], left: [Int]) {
        all_case_number.insert(Int(now.joined()) ?? 0)

        for (index, number) in left.enumerated() {
            set_all_case_number(now: now + [String(number)], left: Array(left[..<index]) + Array(left[index+1..<(left.count)]))
        }
    }
    
    private func isPrime(number: Int) -> Bool {
        if number < 2 { return false }
        for i in 2..<number/2 + 1 {
            if number % i == 0 { return false }
        }
        return true
    }
    
    func get_prime_number_number() -> Int {
        var result = 0
        all_case_number.forEach({ if isPrime(number: $0) { result += 1}})
        return result
    }
}

func solution(_ numbers:String) -> Int {
    
    let allCaseNumber = AllCaseNumber()
    var numbers_array: [Int] = []
    
    Array(numbers).map({ if let number = Int(String($0)) {
        numbers_array.append(number)
    } })
    
    allCaseNumber.set_all_case_number(now: [], left: numbers_array)
    return allCaseNumber.get_prime_number_number()
}

func test() {
    print(solution("17")==3)
    print(solution("011")==2)
}

test()
