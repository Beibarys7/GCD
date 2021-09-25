import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


var greeting = "Hello, playground"

let workItem = DispatchWorkItem(qos: .utility, flags: .detached) {
    print("performing workItem")
}

//workItem.perform()

let queue = DispatchQueue(label: "SWIFT", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: DispatchQueue.global(qos: .userInitiated))

queue.asyncAfter(deadline: .now() + 1, execute: workItem)

workItem.notify(queue: .main) {
    print("WorkItem is completed")
}

workItem.isCancelled
workItem.cancel()
workItem.isCancelled
workItem.wait()
