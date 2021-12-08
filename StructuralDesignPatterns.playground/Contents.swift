import Foundation

//Structural Design Patterns

//1. Adapter

    //Implementation
protocol Adapter {
    func calc(x: Int, y: Int) -> Int
}

class OldCalculator {
    func specificCalc(x: Double, y: Double) -> Double {
        return x + y
    }
}

class UserCalculator: Adapter {
    private let adaptee : OldCalculator
    
    init(calc: OldCalculator) {
        self.adaptee = calc
    }
    
    func calc(x: Int, y: Int) -> Int {
        let doubleX = Double(x)
        let doubleY = Double(y)
        let result = adaptee.specificCalc(x: doubleX, y: doubleY)
        return Int(result)
    }
}


    //Using
let calc1 = OldCalculator()
let calc2 = UserCalculator(calc: calc1)
print(calc2.calc(x: 5, y: 6))


//2. Facade

    //Implementation

class Facade {
    static let shared = Facade()
    
    private init() {}
    
    func callAPI() {
        MockAPI.shared.fetch()
    }
    func saveToDB() {
        CoreDataManager.shared.save()
    }
    func fetchFromDB(){
        CoreDataManager.shared.fetch()
    }
}

class AnotherFacade {
    let data: String
    
    init(data: String) {
        self.data = data
    }
    
    func myPrint() {
        data.myPrint(data: self.data)
    }
}

extension String {
    func myPrint(data: String) {
        print("This is my print function, and my data is: \(data)")
    }
}

protocol APIService {
    func fetch() -> DataModel
}

class MockAPI: APIService {
    static let shared = MockAPI()
    
    private init() {}
    
    func fetch() -> DataModel{
        let url = "https://SomeURL.com"
        print("Data being fetched from \(url)")
        let data = DataModel(name: "API mock data")
        print("Data fetched, data: \(data)!")
        return data
    }
}

struct DataModel {
    let name: String
}

protocol Database {
    func save()
    func fetch() -> DataModel
}

class CoreDataManager: Database {
    static let shared = CoreDataManager()
    private init() {}
    
    func save() {
        print("Data is saved!")
    }
    
    func fetch() -> DataModel {
        print("Data being fetched from database...")
        let data = DataModel(name: "data")
        print("Data fetched from Database!")
        return data
    }
}

    //Using
let facade = Facade.shared
facade.callAPI()
facade.saveToDB()
facade.fetchFromDB()

let anotherFacade = AnotherFacade(data: "Noor's data")
anotherFacade.myPrint()

//3. Composite

    //Implementation

protocol ScreenDrawer {
    var resolution: Int { get set }
    func draw()
    
}

class Image: ScreenDrawer {
    var resolution: Int
    var children: [ScreenDrawer]
    
    init(children: [ScreenDrawer], res: Int) {
        self.children = children
        self.resolution = res
    }
    
    init() {
        self.children = [ScreenDrawer]()
        self.resolution = 0
    }

    func addChild(child: ScreenDrawer) {
        self.children.append(child)
    }
    func removeChild(child: ScreenDrawer) {
        if children.isEmpty == false {
            for (index, item) in children.enumerated() {
                if item.resolution == child.resolution { //Implement any type of comparison
                    children.remove(at: index)
                }
            }
        }
        else {
            print("Array is empty")
        }
    }
    func getChild(in index: Int) -> ScreenDrawer {
        if children.isEmpty == false {
            let child: ScreenDrawer? = children[index]
            if child != nil {
                print(child!)
                return child!
            }
            else {
                print("Item not found")
            }
        }
        else {
            print("Array is empty")
        }
        return Pixel(res: 0)
    }
    
    func draw() {
        for child in children {
            child.draw()
        }
    }
}

class Pixel: ScreenDrawer {
    var resolution: Int
    
    init(res: Int) {
        self.resolution = res
    }
    
    func draw() {
        print("Drawing pixel...")
    }
}

    //Using
let pixel = Pixel(res: 100)
let anotherPixel = Pixel(res: 200)
let composite = Image(children: [pixel, anotherPixel], res: pixel.resolution + anotherPixel.resolution)
let anotherComposite = Image()
composite.draw()

composite.removeChild(child: pixel)
print(composite.children.count)

anotherComposite.addChild(child: pixel)
print(anotherComposite.children.count)
