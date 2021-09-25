class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

class Car {
    var goodDriversIterator: GoodDriversIterator {
        return GoodDriversIterator(drivers: drivers)
    }

    private let drivers = [Driver(isGood: true, name: "Ivan"),
                           Driver(isGood: false, name: "Sasha"),
                           Driver(isGood: true, name: "Meir"),
                           Driver(isGood: true, name: "Aza")]

    
}

class GoodDriversIterator: IteratorProtocol {
    
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter{ $0.isGoodDriver }
    }
    
    func next() -> Driver? {
        defer {
            current += 1
        }
        return drivers.count > current ? drivers[current] : nil
    }
}

let car = Car()

let goodDriverIterator = car.goodDriversIterator.next()
