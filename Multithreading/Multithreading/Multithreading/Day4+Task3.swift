import UIKit

class RecipeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let operationQueue = OperationQueue()

        let operation1 = MyOperation()
        operation1.queuePriority = .low
        operation1.completionBlock = {
            print("Operation 1 completed")
        }

        let operation2 = MyOperation()
        operation2.queuePriority = .high
        operation2.completionBlock = {
            print("Operation 2 completed")
        }

        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
    }
}

class MyOperation: Operation {
    override func main() {
        if isCancelled {
            return
        }

        // Выполнение основной работы операции здесь
        for _ in 0..<50 {
            print("Operation executed")
        }
    }
}

//let viewController = RecipeViewController()
//viewController.viewDidLoad()
