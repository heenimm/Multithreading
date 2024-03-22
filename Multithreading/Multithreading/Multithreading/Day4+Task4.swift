//
//  Day4+Task4.swift
//  Multithreading
//
//  Created by Халимка on 22.03.2024.
//

import UIKit

///Race condition  - два потока пытаются менять общий массив, нужно использовать мьютекс для разграничения доступа

class Day4_Task4: UIViewController {        
      
        override func viewDidLoad() {
            super.viewDidLoad()
           
            // Использование
            let threadSafeArray = ThreadSafeArray()
            let operationQueue = OperationQueue()

            let firstOperation = FirstOperation(threadSafeArray: threadSafeArray)
//            let secondOperation = SecondOperation(threadSafeArray: threadSafeArray)
//
            operationQueue.addOperation(firstOperation)
//            operationQueue.addOperation(secondOperation)

            // Дождитесь завершения операций перед выводом содержимого массива
            operationQueue.waitUntilAllOperationsAreFinished()

            print(threadSafeArray.getAll())
        }
    }

    // Объявляем класс для для синхронизации потоков
class ThreadSafeArray {
    private var array: [String] = []
    private let lock = NSLock()

    func append(_ item: String) {
        lock.lock()
        defer { lock.unlock() }
        array.append(item)
    }

    func getAll() -> [String] {
        lock.lock()
        defer { lock.unlock() }
        return array
    }
}


    // Определяем первую операцию для добавления строки в массив
    class FirstOperation: Operation {
        let threadSafeArray: ThreadSafeArray

        init(threadSafeArray: ThreadSafeArray) {
            self.threadSafeArray = threadSafeArray
        }

        override func main() {
            if isCancelled { return }
            threadSafeArray.append("Первая операция")
        }
    }

    // Определяем вторую операцию для добавления строки в массив
    class SecondOperation: Operation {
        // Создаем по образу первой операции
    }

