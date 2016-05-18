
import Foundation

func sumOdds() -> Int {
    var sum = 0
    for i in 1...100 {
        if i%2 == 1 {
            sum += i
        }
    }
    return sum
}


sumOdds()