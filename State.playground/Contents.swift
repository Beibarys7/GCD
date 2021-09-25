protocol State {
    func on(printer: Printer)
    func off(printer: Printer)
    func printText(printer: Printer)
    
}

class On: State {
    func on(printer: Printer) {
        print("it is on already")
    }
    
    func off(printer: Printer) {
        print("turning off")
        printer.set(state: Off())
    }
    
    func printText(printer: Printer) {
        print("printing")
        printer.set(state: Print())
    }
}

class Off: State {
    func on(printer: Printer) {
        print("turning on")
        printer.set(state: On())
    }
    
    func off(printer: Printer) {
        print("it is on already off")
    }
    
    func printText(printer: Printer) {
        print("it's off we can't print")
        
    }
}

class Print: State {
    func on(printer: Printer) {
        print("turning on")
        
    }
    
    func off(printer: Printer) {
        print("turning off")
        printer.set(state: Off())
    }
    
    func printText(printer: Printer) {
        print("it's already printing")
        printer.set(state: Print())
        
    }
}


class Printer {
    var state: State
    
    init() {
        self.state = On()
    }
    
    func set(state: State) {
        self.state = state
    }
    
    func turnOn() {
        state.on(printer: self)
    }
    
    func turnOff() {
        state.off(printer: self)
    }
    
    func printing() {
        state.printText(printer: self)
    }
}


let printer = Printer()
printer.printing()
printer.turnOff()

printer.turnOn()
printer.turnOn()
printer.turnOff()

printer.turnOff()
