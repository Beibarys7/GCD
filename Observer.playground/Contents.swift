import Foundation

protocol Subject {
    
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
}

class Teacher: Subject {
    
    var observerCollection = NSMutableSet()
    
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection {
            
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
}

protocol PropertyObserver {
    
    func didGet(newTask task: String)
    
}

class Puple: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("New home work to be done!")
    }
}

let teacher = Teacher()
let pupil = Puple()

teacher.add(observer: pupil)
teacher.homeTask = "task 3 on the page 21"

pupil.homeTask

teacher.remove(observer: pupil)

