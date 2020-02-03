import UIKit

var str = "Hello, playground"

func unwrapString(inputString string:String?) -> String{
    if let toRet = string{
        return toRet
    }
    return "inputString is nil"
}

protocol Messagable{
    var message : String? { get }
}

protocol Sendable : Messagable{
    var from : String? { get }
    var to : String { get }
    
    func send()
}

struct Mail : Sendable{
    var from : String?
    var to : String
    var message: String?

    func send(){
        var unwrapFrom : String
        var unwrapMessage : String
        
        if let validFrom = self.from, let validMessage = self.message{
            unwrapFrom = validFrom
            unwrapMessage = validMessage
        }else{
            unwrapFrom = "INVALID"
            unwrapMessage = "INVALID"
        }
        
        
        print("Send a mail \(unwrapFrom) to \(self.to) : \(unwrapMessage)")
    }
}

struct Feedback : Sendable{
    var from: String?{
        return nil
    }
    var to: String
    var message: String?
    
    
    func send() {
        var unwrapMessage : String
        
        if let validMessage = self.message{
            unwrapMessage = validMessage
        }else{
            unwrapMessage = "INVALID"
        }
        print("Send a feedback to \(self.to) : \(unwrapMessage)")
    }
}

func sendAnything(_ sendable: Sendable){
    sendable.send()
}



let mail = Mail(from: "sokiwar@gmail.com", to: "pjs0805@gmail.com", message: "Hello")
let feedback = Feedback(to: "pjs0805@gmail.com", message: "Hello")

sendAnything(mail)
sendAnything(feedback)

