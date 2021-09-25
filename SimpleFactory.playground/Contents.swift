
protocol Car {
    func drive()
}

class HugeCar: Car {
    
    func drive() {
        print("Huge drive car")
    }
}

class FastCar: Car {
    func drive() {
        print("Fast drive car")
    }
}

enum CarType {
    case huge,fast
}

class CarFactory {
    
    static func producCarType(type: CarType) -> Car {
        var car: Car
        switch type {
        case .huge: car = HugeCar()
        case .fast: car = FastCar()
            
        }
        return car
        
    }
}

let hugeCar1 = CarFactory.producCarType(type: .huge)
let fastCar1 = CarFactory.producCarType(type: .fast)
