import UIKit

var str = "Hello, playground"

struct Fahrenheit{
    var temperature : Double
    
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()

print("The default temperature is \(f.temperature).")

struct Celsius{
    var temperatureInCelsius : Double
    
    init(fromFahrenheit fahrenheit : Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin : Double){
        temperatureInCelsius = kelvin - 273.15
    }
}

struct Color{
    let red, green, blue : Double
    
    init(red:Double, green:Double, blue:Double){
        self.red    = red
        self.green  = green
        self.blue   = blue
    }
    
    init(white:Double){
        red     = white
        green   = white
        blue    = white
    }
}

class Rect{
    static var count = 0
    var origin = CGPoint()
    var size =  CGSize()
    
    init() {
        Rect.count += 1
        origin = CGPoint(x: 1.0, y: 2.0)
        size = CGSize(width: 1.0, height: 2.0)
    }
    
    init(origin : CGPoint, size : CGSize){
        self.origin = origin
        self.size = size
    }
    
    convenience init(size : CGSize){
        self.init(center : CGPoint(x: 1.0, y: 1.0), size : size)
    }
}

extension Rect{
    convenience init(center : CGPoint, size : CGSize){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.width/2)
        self.init(origin : CGPoint(x : originX, y : originY), size : size)
    }
}

class Vehicle{
    var numberOfWheels = 0
    var description : String{
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle:Vehicle{
    override init(){
        super.init()
        numberOfWheels = 2
    }
}


//Failable Initializer
//struct Animal{
//    let species : String
//    init?(species : String){
//        if species.isEmpty { return nil }
//        self.species = species
//    }
//}

//Failable Initializer for enum
enum TemperatureUnit{
    case kelvin, celsius, fahrenheit
    init?(symbol:Character){
        switch symbol{
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

protocol SomeProtocol {
    var mustBeSettable : Int { get set }
    var doesNotNeedToBeSettable : Int { get }
}

protocol Animal{
    var legs : Int { get }
}

//struct Person : Animal {
//    var legs : Int {
//        return 2
//    }
//}

struct Dog : Animal {
    var legs : Int {
        return 4
    }
}

protocol Named {
    var name : String { get }
}

protocol Aged {
    var age : Int { get }
}

//struct Person : Named, Aged{
//    var name : String
//    var age : Int
//}
//
//func wishHappyBirthday(to celebrator : Person){
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
//}
//let birthdayPerson = Person(name: "Malcolm", age: 21)
//wishHappyBirthday(to: birthdayPerson)

//Generic
func swapTwoValue<T>(_ a:inout T, _ b:inout T){
    let tmp = a
    a = b
    b = tmp
}

//Generic Stack
struct Stack<Element>{
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

func findIndex(ofString valueToFind:String, in array:[String]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}
 
//Error Handling
func canThrowError() throws -> String{
    return ""
}
func cannotThrowError() -> String{
    return ""
}

enum Errors : Error{
    case defaultError
}

func errorThrower1() throws{
    throw Errors.defaultError
}

func errorThrower2() throws{
    try errorThrower1()
    print("ErrorThrower2")
}

do{
    try errorThrower2()
}catch{
    print("catch")
}

var integers = ["1":1,"2":2,"3":3,"4":4]
//var toAdd : Int = 0
//if let tmp = integers["1"] {
//    toAdd = tmp
//}
integers["1"] = (integers["1"] ?? 0) + 1

print(integers["1"]!)
//
//class Person{
//    let name : String
//    init(name:String){
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//
//var ref1:Person?
//var ref2:Person?
//var ref3:Person?
//
//ref1 = Person(name: "John Appleseed")
//ref2 = ref1
//ref3 = ref1
//
//
//ref1 = nil
//print("ref1 is nil")
//ref2 = nil
//print("ref2 is nil")
//ref3 = nil
//print("ref3 is nil")


class Person{
    let name:String
    init(name:String){
        self.name = name
        print("\(name) is being initialized")
    }
    weak var apartment:Apartment?
    deinit{ print("\(name) is being deinitialized") }
}

class Apartment {
    let unit:String
    init(unit:String){
        self.unit = unit
        print("Apartment \(unit) is being initialized")
    }
    var tenant:Person?
    deinit { print("Apartment \(unit) is beign deinitialized") }
}

var john:Person? = Person(name: "John Appleseed")
var unit4A:Apartment? = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil

//Strong Reference Cycle when use Closure
class HTMLElement{
    let name:String
    let text:String?
    
//    var asHTML: () -> String{
//        return {
//            if let text = self.text{
//                return "<\(self.name)>\(text)</\(self.name)>"
//            }else{
//                return "<\(self.name)>"
//            }
//        }
//    }
    //캡처 리스트를 써야 하는 경우
    //1. 이 클로저가 stored property인 경우
    //외에 클로저가 사용되고 바로 사라지는 경우는 캡처리스트를 작성하지 않아도됨.
    lazy var asHTML:()->String = { [weak self] in
        if let text = self?.text{
            return "<\(self?.name ?? "")>\(text)</\(self?.name ?? "")>"
        }else{
            return "<\(self?.name ?? "")>"
        }
    }
    
    init(name:String, text:String? = nil){
        self.name = name
        self.text = text
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
}

var paragraph : HTMLElement = HTMLElement(name: "p", text: "hello, world")

print(paragraph.asHTML())

//paragraph = nil

