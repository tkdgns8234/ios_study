import UIKit

var greeting = "Hello, playground"

// --- 상수 , 변수 ---
// 상수
let a: Int = 4
//a = 5

// 변수
var b: Int = 100
b = 10

// 타입 추론
var num = 10

// --- collection ---
// array
var numbers: Array = Array<Int>()
var names = [String]()
var names1: [String] = []

numbers.append(1)
numbers[0]
numbers.insert(0, at: 1)

//dictionaray
var dic: Dictionary = Dictionary<String, Int>()
var dic1: [String: Int] = [:]
var dic2 = ["정상훈":1]
dic["김성원"] = 0


//Set
var set: Set = Set<Int>()
set.insert(10)

// --- 함수 ---
func sum(a: Int, b: Int) -> Int {
    return a + b
}

// 함수의 전달 인자 레이블
func sendMessage(from myName: String, to friendName: String) -> String {
    return "안녕 \(friendName)아 나는 \(myName)이야 "
}

sendMessage(from: "정상훈", to: "김성원")

// 가변 매개변수
func friends(me: String, friends: String...) -> String {
    return "\(me), 친구들: \(friends)"
}

friends(me: "정상훈", friends: "가나다", "마바사")


// --- 조건문 ---
let age = 14
if age < 15 {
    print("미성년자 입니다.")
}

let color = "green"
switch color {
case "green":
    print("초록색")
case "red":
    print("빨간색")
default:
    print("색이 없습니다.")
}


// --- 반복문 ---

for i in 1...10 {
    i
}

let arr = [1,2,3,4,5]
for i in arr {
    print(i)
}

// do while 같은 구문, repeat

var n = 0
repeat {
    print(n)
    n += 1
} while n < 5

// --- optional ---
var name: String? // 값을 넣지 않아도 nil 이 대입되어있음
//print(name)  // -> 옵셔널 객체로 감싸져있음, 옵셔널 바인딩 필요

// --- 옵셔널 바인딩 ---
//명시적 해제, 묵시적 해제(컴파일러에의한 해제)

// 명시적 해제
var numb: Int? = 3
//print(numb)
print(numb!) // 강제로 해제, 위험
// 비강제해제
if let n = numb { //옵셔널 바인딩된 n 의 선언, 사용
    print(n)
} else {
    
}
// if 사용 시, if 블록에서만 사용 가능하지만 guard 사용 시 그 이하 범위에서 자유롭게 사용 가능
// guard 는 true 일때만 가드문 통과, false 면 else 수행후 종료
func guardTest() {
    let number: Int? = 45
    guard let num = number else { return }
    print(num)
}

guardTest()

// if 조건문 사용시 자동으로 옵셔널 해제 됨
let testVal: Int? = 4

if testVal == 4 {
    print("true")
} else {
    print("false")
}


// 묵시적 옵셔널 해제
let string = "123"
var stringToInt: Int! = Int(string)
print (stringToInt + 1)



// --- 구조체 / 클래스 ---
// 구조체: 값의 복사가 됨, 간단한 자료구조 나타낼때
// 클래스: 주솟값의 복사, 객체지향과 관련된 클래스가 필요할 때 사용

// 구조체,class 는 deinit 제외하고 똑같음, 메모리구조적차이 등등 제외한 문법적으론
struct User {
    var id: Int
    var nickName: String
    
    init (id: Int, nickName: String) {
        self.id = id
        self.nickName = nickName
    }
    
    init (id: Int) {
        self.id = id
        self.nickName = "정상훈"
    }
    
    func info() {
        print("\(id)")
    }
}

var user = User(id: 1, nickName: "sh")
user.id = 4
user.info()

var user2 = User(id: 4)
user2.nickName


// 프로토콜
// init 키워드를 프로토콜에서 사용 시
// required 키워드를 필수로 붙여야함, 이건 하위클래스 init 구현 강제화

protocol FirstProtocol {
    init (param: Int)
    var name: String { get }
    var age: Int { get set }
}

class Person: FirstProtocol {
    
    var name: String
    var age: Int
    
    required init(param: Int) {
        name = ""
        age = param
    }
}

// swift 연산 프로퍼티
class A {
    var number: Int {
        get {
            return 1
        }
        set {
            
        }
    }
}


// extension
// 짝수, 홀수 판별

extension Int {
    func isOdd() -> Bool {
        return self % 2 != 0
    }
    
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

1.isOdd()

// 열거형
enum Point: String {
    case one = "one"
    case two = "two"
    case three = "three"
    case four = "four"
}

var point = Point.four
point = .one


switch point {
case .one:
    print(point.rawValue)
default:
    print("a")
}
var point2 = Point(rawValue: "point")

// 열거형은 각각 따로 rawValue를 가질 수 있음
enum PhoneError {
    case unKnown
    case batteryLow(String)
}

var error = PhoneError.batteryLow("a")

switch error {
case .batteryLow(let msg):
    print(msg)
case .unKnown:
    print("unknown")
}

// --- try - catch ---

/*
 do{
 try 구문
 }
 catch {
 
 }
 
 try? 구문 시 nil 반환
 try!
 */

// --- 클로저 ---
/*
 { (매개 변수) -> 리턴 타입 in
   실행 구문
 }
 */

// 클로저는 기본적으로 외부 변수를 캡처할 때 강한참조로 캡처한다.
// 약한 참조(값의 복사)를 수행하기 위해 캡처리스트 사용
