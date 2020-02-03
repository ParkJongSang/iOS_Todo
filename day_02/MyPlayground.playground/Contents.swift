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
struct Animal{
    let species : String
    init?(species : String){
        if species.isEmpty { return nil }
        self.species = species
    }
}

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


