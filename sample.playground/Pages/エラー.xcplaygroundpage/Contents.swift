//: [Previous](@previous)

/*:
# エラーハンドリング
*/

import Foundation

/*:
## Swift 1までのやり方
*/

enum Result<T> {
    case Success(T)
    case Failure(NSError)
}
let errorCodeShouldNotBeEmpty = 1

func upper(input: String) -> Result<String> {
    if input.isEmpty {
        return .Failure(NSError(domain: "com.mono0926", code: errorCodeShouldNotBeEmpty, userInfo: nil))
    }
    return .Success(input.uppercaseString)
}

upper("") // -> Failure
upper("foo") // -> Success("FOO")

// switch文などを用いてハンドリング
switch upper("foo") {
case .Success(let value):
    print(value)  // -> "FOO"
case .Failure(let error):
    print(error)
}

/*:
## Swift 2で導入されたtry-catch
*/

enum MyError: ErrorType {
    case ShouldNotBeEmpty, BarError
}

func upper2(input: String) throws -> String  {
    if input.isEmpty {
        throw MyError.ShouldNotBeEmpty
    }
    return input
}

do {
    defer {
        print("defer")
    }
    try upper2("")
} catch MyError.ShouldNotBeEmpty {
    print("error occured")
} catch {
    // すべてのエラー
}

//try! upper2("")
try! upper2("foo")

func upper3(@autoclosure f: () throws -> String) rethrows -> String {
    return try f()
}
try! upper3(upper2("foo"))