
protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxster: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxster"
    }
}

class PorscheDecoreted: Porsche {
    let decoretedPorsche: Porsche
    
    required init(db: Porsche) {
        self.decoretedPorsche = db
    }
    
    func getPrice() -> Double {
        return decoretedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoretedPorsche.getDescription()
    }
}

class PremiumAudioSystem: PorscheDecoreted {
    
    required init(db: Porsche) {
        super.init(db: db)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with Premium Audio System"
    }
    
}

class PanoramicSunRoof: PorscheDecoreted {
    required init(db: Porsche) {
        super.init(db: db)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    
    override func getDescription() -> String {
        return super.getDescription() + "With Panoramic SunRoof"
    }
}

var porscheBoxster: Porsche = Boxster()

porscheBoxster.getDescription()
porscheBoxster.getPrice()

porscheBoxster = PremiumAudioSystem(db: porscheBoxster)
porscheBoxster.getDescription()
porscheBoxster.getPrice()

porscheBoxster = PanoramicSunRoof(db: porscheBoxster)
porscheBoxster.getDescription()
porscheBoxster.getPrice()

