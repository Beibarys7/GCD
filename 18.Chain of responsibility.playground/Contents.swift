class Enemy {
    let strength = 600
}

protocol MillitaryChain {
    var strength: Int { get }
    var nextRank: MillitaryChain? { get set }
    func shoudDefeatWithStrength(amount: Int)
}

class Soldier: MillitaryChain {
    var strength = 100
    var nextRank: MillitaryChain?
    func shoudDefeatWithStrength(amount: Int) {
        if strength > amount {
            print("Soldier got it")
        } else {
            nextRank?.shoudDefeatWithStrength(amount: amount)
        }
    }
}

class Officer: MillitaryChain {
    var strength = 500
    var nextRank: MillitaryChain?
    func shoudDefeatWithStrength(amount: Int) {
        if strength > amount {
            print("Officer got it")
        } else {
            nextRank?.shoudDefeatWithStrength(amount: amount)
        }
    }
}

class General: MillitaryChain {
    var strength = 1000
    var nextRank: MillitaryChain?
    func shoudDefeatWithStrength(amount: Int) {
        if strength > amount {
            print("General got it")
        } else {
            print("We can't win this enemy")
        }
    }
}

let enemy = Enemy()

let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general


soldier.shoudDefeatWithStrength(amount: enemy.strength)
soldier.nextRank
