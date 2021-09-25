

protocol SwimBehavior {
    
    func swim()
}

class ProfessionSwimmer: SwimBehavior {
    
    func swim() {
            print("Profession Swimming")
    }
}

class NonSwimmer: SwimBehavior {
    
    func swim() {
            print("Non Swimming")
    }
}

protocol DiveBehaivor {
    
    func dive()
}


class ProfessionDiver: DiveBehaivor {
    
    func dive() {
        print("Profession diving")
    }
}

class NonDiver: DiveBehaivor {
    func dive() {
        print("Non diving")
    }
}


class Human {
    
    var swimBehaivor: SwimBehavior!
    var diveBehaivor: DiveBehaivor!
    
    func performSwim() {
        swimBehaivor.swim()
    }
    
    func performDive() {
        diveBehaivor.dive()
    }
    
    func run() {
        print("Running")
    }
    
    func setSwimBehaivor(sb: SwimBehavior) {
        self.swimBehaivor = sb
    }
    
    func setDiveBehaivor(db: DiveBehaivor) {
        self.diveBehaivor = db
    }
    
    init(swimBehaivor: SwimBehavior, diveBehaivor: DiveBehaivor) {
        self.swimBehaivor = swimBehaivor
        self.diveBehaivor = diveBehaivor
    }
}


let human = Human(swimBehaivor: ProfessionSwimmer(), diveBehaivor: NonDiver())
//human.setDiveBehaivor(db: ProfessionDiver())
human.setSwimBehaivor(sb: NonSwimmer())
human.performSwim()

//human.setDiveBehaivor(db: NonDiver())
human.performDive()
