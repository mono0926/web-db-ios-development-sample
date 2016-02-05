import UIKit


/*: Swift 2で増えた文法をなぞる
# Swift 2で増えた文法をなぞる
*/

/*:
## guard文でネストの防止
*/


/*:
## Optionalの説明
*/

let number: Int? = 5
//print(number * 10)
if let number = number {
    print(number * 10) // -> 50
}

/*:
## if letでネストが発生してしまっている例
*/

func printIfPositive(value: Int?) {
    if let value = value { // アンラップ
        if value > 0 {
            print(value)
        }
    }
}

printIfPositive(5)
printIfPositive(-1)

/*:
## guard・whereでネストの発生を防げている例
*/

func printIfPositive2(value: Int?) {
    guard let value = value where value > 0 else {
        return
    }
    print(value)
}

printIfPositive2(5)
printIfPositive2(-1)
