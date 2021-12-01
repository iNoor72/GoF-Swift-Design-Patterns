import Foundation
import Darwin

//This file implements the Design Patterns from Gang of Four book using Swift Programming Language

//Creational Design Patterns


//1. Singleton

    //Implementation
class Singleton {
    static let sharedInstance = Singleton()
    private init() {}
    
    func printingFunction() {
        print("Hello, I'm a singleton, and this is how to use me to call other functions inside me")
    }
}

    //Calling
    //(1)
let mySingleton = Singleton.sharedInstance
mySingleton.printingFunction()

    //(2)
Singleton.sharedInstance.printingFunction()


//2. Factory Method

    //Implementation
protocol Factory {
    func buildCar() -> Car
}

class BMWFactory: Factory {
    func buildCar() -> Car {
        print("Building BMW...")
        let car = BMW()
        print("BMW is built!")
        return car
    }
}

class MercedesFactory: Factory {
    func buildCar() -> Car {
        print("Building Mercedes...")
        let car = Mercedes()
        print("Mercedes is built!")
        return car
    }
}


protocol Car {
    func drive()
}

class Mercedes: Car {
    func drive() {
        print("I'm driving my Mercedes 🚗")
    }
}

class BMW: Car {
    func drive() {
        print("I'm driving my BMW 🚗")
    }
}


    //Calling
let factory = BMWFactory()
let car = factory.buildCar()
car.drive()

let anotherFactory = MercedesFactory()
let anotherCar = anotherFactory.buildCar()
anotherCar.drive()
