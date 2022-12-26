import UIKit

var greeting = "Hello, playground"

for i in 0...99 {
    i
}

var a = 0 //타입 추론
a = 200

/* 배열 선언 방법 3가지 */
var names: Array<Int> = Array<Int>()
names.append(1)
names.append(contentsOf: [1,2,3])
names

var name = [String]()
name.append("5")
name

var name2: [String] = []

/* 딕셔너리 */
var dic: Dictionary<String, Int> = Dictionary<String, Int>()
var dic2: [String: Int] = [:]
var dic3: [String: Int] = ["정상훈": 1]
dic3["김민지"] = 4
dic3.removeValue(forKey: "김민지")
dic3["정상훈"]

/* set */
var set: Set<Int> = Set<Int>()
set.insert(5)
set.insert(15)
set.insert(15)
set

set.contains(5)

/* 함수 */
func hello(name: String, age: Int) -> String {
    return "hello name = \(name), age = \(age)"
}

hello(name: "정상훈", age: 29)


/* Optional */
// 옵셔널 값의 경우 비교연산 수행 시 컴파일러가 자동으로 옵셔널 값을 해제해줌
var str = "정상훈"
var str_optinal: String? = "정상훈2"

//str = str_optinal err!

if let rs = str_optinal {
    print(rs)
}

// guard 구문의 경우 해당 함수 내에서 계속 사용 가능
func optional_test() {
    let test: Int? = 1
    guard let result = test else { return }
    print(result)
}
optional_test()


/* 구조체 */
struct Person {
    var age: Int
    var nickName: String
    
    func printPerson() {
        print("age= \(age), nickName = \(nickName)")
    }
}
let person = Person(age: 12, nickName: "정상훈")
person.age
person.nickName

person.printPerson()

/* 클래스 */
// 클래스의 프로퍼티는 초기화 되어야만 함
// 구조체는 value 타입이라 let 으로 선언 시 내부 변수들을 변경할 수 없음
// 클래스는 참조타입이기에 동작이 다름
class Dog {
    var name: String
    var age: Int
    
    init() {
        self.name = "hoon"
        self.age = 13
    }
    
    func printDog() {
        print("name = \(name), age = \(age)")
    }
}

var dog = Dog()
dog.printDog()

/* 프로퍼티 */
// 인스턴스의 변수(속성)
// 저장 프로퍼티, 연산 프로퍼티 -> 게터 세터 이용, 옵저버 프로퍼티 -> willset, didset , 타입 프로퍼티: static

// 클래스 구조체 차이
/* 클래스
 - 참조타입
 - 스택 - 주소만 저장 실제 저장 - 힙영역
 - deinit 사용 가능
 - 대입 시 메모리 복사
 */
/* 구조체
 - 값 타입
 - 대입 시 값의 복사
 */

/* 클로저
 익명함수
 { (매개변수) -> 리턴 타입 in
    실행 구문
 }
 */

var closer = { () -> () in
    print("test")
}

closer()

let hello = { (name: String) -> String in
    return "my name is \(name)"
}

print(hello("wjdtkdgns"))
