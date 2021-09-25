class Account {
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}


protocol Command {
    func execute()
    var isComplete: Bool { get set }
}

class Deposite: Command {
    private var _account: Account
    private var _amount: Int
    
    var isComplete = false
    
    init(account: Account, ammount: Int) {
        self._account = account
        self._amount = ammount
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
}

class withDraw: Command {
    private var _account: Account
    private var _amount: Int
    
    var isComplete = false
    
    init(account: Account, ammount: Int) {
        self._account = account
        self._amount = ammount
    }
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("Not enought money!")
        }

    }
}

class TransactionManager {
    static let shared = TransactionManager()
    private init () {}
    
    private var _transactions: [Command] = []
    
    var pendingTransactions: [Command] {
        get {
            return self._transactions.filter{ $0.isComplete == false}
        }
    }
    
    func addTransactions(command: Command) {
        self._transactions.append(command)
    }
    
    func processiongTransactions() {
        _transactions.filter{ $0.isComplete == false }.forEach{ $0.execute()}
    }
}

let account = Account(accountName: "Akulav Ivan", balance: 1000)
let transactionManager = TransactionManager.shared

transactionManager.addTransactions(command: Deposite(account: account, ammount: 500))
transactionManager.processiongTransactions()
account.balance
transactionManager.addTransactions(command: withDraw(account: account, ammount: 200))
transactionManager.processiongTransactions()
account.balance
