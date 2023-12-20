import Foundation

var mutex = NSLock()
var accountBalance = 1000

func withdraw(amount: Int) {
    mutex.lock()
    defer {
        mutex.unlock()
    }
    
    if accountBalance >= amount {
        Thread.sleep(forTimeInterval: 1)
        accountBalance -= amount
        print("Withdrawal successful. Remaining balance: \(accountBalance)")
    } else {
        print("Insufficient funds")
    }
}

func refillBalance(amount: Int) {
    mutex.lock()
    defer {
        mutex.unlock()
    }
    
    Thread.sleep(forTimeInterval: 1)
    accountBalance += amount
    print("Refill successful. Remaining balance: \(accountBalance)")
}

for _ in 1...5 {
    withdraw(amount: 100)
    refillBalance(amount: 100)
}

Thread.sleep(forTimeInterval: 12)
