import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let queue = DispatchQueue(label: "swiftbook.semaphere", attributes: .concurrent)

let semaphere = DispatchSemaphore(value: 0)
semaphere.signal()
queue.async {
    semaphere.wait(wallTimeout: .distantFuture)
    Thread.sleep(forTimeInterval: 4)
    print("Block 1")
    semaphere.signal()
}

queue.async {
    semaphere.wait(wallTimeout: .distantFuture)
    Thread.sleep(forTimeInterval: 2)
    print("Block 2")
    semaphere.signal()
}

queue.async {
    semaphere.wait(wallTimeout: .distantFuture)
    print("Block 3")
    semaphere.signal()
}

queue.async {
    semaphere.wait(wallTimeout: .distantFuture)
    print("Block 4")
    semaphere.signal()
}
