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


//3. Abstract Factory

//Implementation
protocol AbstarctFactory {
    func buildChair() -> Furniture
}

class ClassicFurnitureFactory: AbstarctFactory {
    func buildChair() -> Furniture {
        print("Building Classic Chair...")
        let chair = ClassicChair()
        print("Classic Chair is built!")
        return chair
    }
}

class ModernFurnitureFactory: AbstarctFactory {
    func buildChair() -> Furniture {
        print("Building Modern Chair...")
        let chair = ModernChair()
        print("Modern Chair is built!")
        return chair
    }
}


protocol Furniture {
    func sit()
}

class ClassicChair: Furniture {
    func sit() {
        print("Classic Chairs Feels Royal!")
    }
}

class ModernChair: Furniture {
    func sit() {
        print("Modern Chairs Feels Comfy!")
    }
}

//Calling

let classicFactory = ClassicFurnitureFactory()
let chair = classicFactory.buildChair()
chair.sit()

let modernFactory = ModernFurnitureFactory()
let anotherChair = modernFactory.buildChair()
anotherChair.sit()


//4. Builder

//Implementation

protocol MoldBuilder {
    func buildHead() -> Parts
    func buildBody() -> Parts
    func buildArms() -> Parts
    func buildLegs() -> Parts
    func glue() -> MoldProducts
}

class AnimalBuilder: MoldBuilder {
    func buildHead() -> Parts{
        return Head()
    }
    
    func buildBody() -> Parts{
        return Body()
    }
    
    func buildArms() -> Parts{
        return Arms()
    }
    
    func buildLegs() -> Parts{
        return Legs()
    }
    
    func glue() -> MoldProducts {
        print("Head is building")
        let head = buildHead()
        
        print("Body is building")
        let body = buildBody()
        
        print("Arms are building")
        let arms = buildArms()
        
        print("Legs are building")
        let legs = buildLegs()
        
        print("Gluing the product...")
        let product = Animal(parts: head, body, arms, legs)
        print("Product is build!")
        return product
    }
    
}

class Director {
    var builder: MoldBuilder
    
    init(builder: MoldBuilder) {
        self.builder = builder
    }
    
    func construct() -> MoldProducts{
        builder.buildHead()
        builder.buildBody()
        builder.buildArms()
        builder.buildLegs()
        return builder.glue()
    }
}

protocol Parts {
    
}

class Head: Parts {
    
}

class Body: Parts {
    
}

class Arms: Parts {
    
}

class Legs: Parts {
    
}
protocol MoldProducts {
    var parts: [Parts] { get set }
    func makeASound()
}

class Animal: MoldProducts {
    var parts : [Parts]
    
    init(parts: Parts...) {
        self.parts = parts
    }
    
    func makeASound() {
        print("Meow!")
    }
}

    //Using
let builder = AnimalBuilder()
let director = Director(builder: builder)
let product = director.construct()
product.makeASound()

//5. Prototype

//Implementation

protocol Prototype {
    func clone()
}


//6. Object Pool

//Implementation
class ObjectPool {
    let objects: [Object] = [Object(), Object(), Object()]
    
    func acquire() {
        
    }
    
    func release() {
        
    }
}

class Object {
    
}
