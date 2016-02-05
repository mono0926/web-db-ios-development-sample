//: [Previous](@previous)

import Foundation

/*:
# オプショナル型
*/

/*:
## nilアクセス
*/

let danger: String! = nil
//print(danger + "foo") // -> nilアクセスでクラッシュ


/*:
## オプショナル型
*/

let safe: String? = nil
// "nil"が出力される
print(safe)
// オプショナルなStringと、通常のString型は足せない
//print(safe + "foo") // コンパイルエラー

// アンラップ(値の取り出し)操作によってString型となる
if let safe = safe {
    print(safe + "foo")
}



let a = "hoge,fuga"
let b = a.characters.split(Character(",")).map { String($0) }
b
