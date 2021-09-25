protocol Coworker {
    func hire(coworker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

// branch
class Manager: Coworker {
    private var coworkers = [Coworker]()
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        self.coworkers.append(coworker)
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
        for coworker in coworkers {
            coworker.getInfo()
        }
    }
}

// leaf
class LowManager: Coworker {
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        print("can't coworker")
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
    }
}

let topmanager = Manager(lvl: 1)
let manage_lvl2 = Manager(lvl: 2)
let manage_lvl3_2 = Manager(lvl: 3)
let manage_lvl3_1 = Manager(lvl: 3)
let manager_lvl_10 = Manager(lvl: 10)
topmanager.hire(coworker: manage_lvl2)
manage_lvl2.hire(coworker: manage_lvl3_1)
manage_lvl2.hire(coworker: manage_lvl3_2)
manage_lvl3_1.hire(coworker: manager_lvl_10)
manage_lvl3_1.getInfo()
