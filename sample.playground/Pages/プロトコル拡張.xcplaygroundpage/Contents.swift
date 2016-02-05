//: [Previous](@previous)

/*:
# プロトコル拡張
*/

import Foundation
import UIKit

protocol Invokable {
    var value: String { get }
    func invoke()
}
extension Invokable {
    var value: String { return "value" }
    func invoke() {
        print("invoke called")
    }
}

class Foo: Invokable {
}

struct Bar: Invokable {
}

Foo().invoke() // -> "invoke called"

let a = [1,2,3,4,5]
let b = a[2...3]
b