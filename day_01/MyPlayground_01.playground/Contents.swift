import UIKit

let maxCount = 10       //constant : 상수
var currentCount = 0    //variable : 변수

let http404Error = (404, "Not Found")

let number: Int! = Int("1234")

let names = ["Alex", "Alex", "Brian", "Jack"]

for name in names{
    print("Hello \(name)")
}

for i in 0...100 where (i%3) == 0{
    print("\(i) is multiple 3")
}

let number_A : Int? = 1

if let number_A = number_A{
    print(number_A)
}

var number_B : Int?
//if number_B = number_A {
//    printf("Success")
//}

//Array Init
let array = Array<Int>(repeating: 1, count: 20)
print(array.count)
print(array.isEmpty)

for (index, value) in array.enumerated(){
    print("\(index):\(value)")
}

//Set init
let letters = Set<Character>()

//Dict init
let map:[String:Int] = ["Park":28, "Zoo":26]

if let agePark = map["Park"]{
    print("agePark is \(agePark)")
}else{
    print("agePark is nil")
}

if let ageZoo = map["Zoo"]{
    print("ageZoo is \(ageZoo)")
}else{
    print("ageZoo is nil")
}

if let ageNil = map["Nil"]{
    print("ageNil is \(ageNil)")
}else{
    print("ageNil is nil")
}

func swapInts(_ a: inout Int, _ b: inout Int){
    let tmp = a
    a = b
    b = tmp
}

//guard-let과 if-let의 차이
func printValues(integer: Int?, string: String?, double:Double?){
    guard let integer = integer, let double = double else{
        //escape this function
        return
    }
    
    if let string = string{
        //continue this function
        print(string)
    }
    
    print(integer, double)
}

let value = 1

switch value {
case 1:
    print(1)
    fallthrough
case 2:
    print(2)
    fallthrough
case 3:
    print(3)
    fallthrough
default:
    print("default")
}

printValues(integer: 20, string: "ParkJongSang", double: 3.0)

func makeIncrementer(forIncrement amount: Int = 5) -> () -> Int{
    var runningTotal: Int = 0;
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementer: () -> Int = makeIncrementer()
print("result = \(incrementer())")
print("result = \(incrementer())")

//func AFunction(){
//    func TestFunction(){
//
//    }
//}
//
//func BFunction(){
//    func TestFunction(){
//
//    }
//}

var num_array = [10, 20, 40, 50]

print(num_array.sorted(by : {(s1:Int, s2:Int) -> Bool in
    return s1 > s2
    }))

var completionHandlers: [()->Void] = []

func appendCompletionHandler(_ handler: @escaping() -> Void){
    completionHandlers.append(handler)
}

func printNextValue(_ closure: @autoclosure () -> Int){
    print("value : \(closure())")
    print("value : \(closure())")
}
printNextValue(num_array.removeFirst())

class SingleTon {
    static let shared = SingleTon()
    
    private init(){
        
    }
}

@propertyWrapper struct TwelveOrLess{
    private var number = 0
    var wrappedValue : Int{
        get { return number }
        set { number = min(newValue, 12)}
    }
}

struct SmallRect{
    @TwelveOrLess var height:Int
    @TwelveOrLess var width:Int
}

var smallRect = SmallRect()
print(smallRect.height)

smallRect.height = 20
print(smallRect.height)

smallRect.height = 5
print(smallRect.height)
struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center : Point{
        get{
//            let centerX = origin.x + (size.width/2)
//            let centerY = origin.y + (size.height/2)
//            return Point(x: centerX, y: centerY)
            Point(x: origin.x + (size.width/2),
                  y: origin.y + (size.height/2))
        }
        set{
//            origin.x = newCenter.x - (size.width/2)
//            origin.y = newCenter.y - (size.height/2)
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}

var square = Rect(origin: Point(x:0.0, y:0.0), size: Size(width: 10.0, height: 10.0))
let initailSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

print("square center is x:\(square.origin.x) y:\(square.origin.y)")

func delay(_ completionHandler: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + 5){
        completionHandler()
    }
}

print("startDelay \(Date().timeIntervalSince1970)")

delay{
    print("delay completed: \(Date().timeIntervalSince1970)")
}


class ArrayWrapper{
    private var array = [9,2,3,4]
    
    subscript (_ index: Int) -> Int {
        get {
            print("get arrya \(index) : \(self.array[index])")
            return self.array[index]
        }
        set {
            print("set arrya \(index) : \(newValue)")
            self.array[index] = newValue
        }
    }
}

let arrayWrapper = ArrayWrapper()
arrayWrapper[0] = 1
print(arrayWrapper[0])

class Matrix{
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows:Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    
    func isValid(rows: Int, columns: Int) -> Bool {
        return rows >= 0 && rows < self.rows && columns >= 0 && columns < self.columns
    }
    
    subscript(row:Int, column: Int) -> Double{
        get{
            assert(isValid(rows: row, columns: column), "Index out of range")
            return grid[(row * column) + column]
        }
        set{
            assert(isValid(rows: row, columns: column), "Index out of range")
            grid[(row * column) + column] = newValue
        }
    }
}

func hello(name: String, time: Int) -> String {
    var string = ""
    for _ in 0..<time {
        string += "\(name)님 안녕하세요!\n"
    }
    return string
}


