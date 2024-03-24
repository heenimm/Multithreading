//
//  Day3+Task4.swift
//  Multithreading
//
//  Created by Халимка on 21.03.2024.
//

import UIKit

class Day3_Task4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - 1 // проблема в том что используется синхронная операция внутри асинхронной, на одной и той же очереди диспетчера и это приводит в дэдлоку. Следовательно sync блокирует поток  до завершения переданного замыкания, а async продолжает выполнение без ожидания выполнения переданного замыкания. Нужно изменить внутренний sync на async
    
//    let serialQueue = DispatchQueue(label: "com.example.myQueue")
//
//    serialQueue.async {
//       serialQueue.sync {
//           print("This will never be printed.")
//       }
//    }
    
    //MARK: - 2 // В данном коде два асинхронных блока изменяют общий ресурс sharedResource, без синхронизации доступа к нему  - это может привести к гонке данных. Для решения данной проблемы необходимо синхронизировать доступ к критической секции с помощью мьютекса
    
//    override func viewDidLoad() {
//           super.viewDidLoad()
//           
//           var sharedResource = 0
//           var lock = Lock()
//
//           DispatchQueue.global(qos: .background).async {
//               for _ in 1...100 {
//                   lock.lock()
//                   sharedResource += 1
//                   lock.unlock()
//               }
//           }
//
//           DispatchQueue.global(qos: .background).async {
//               for _ in 1...100 {
//                   lock.lock()
//                   sharedResource += 1
//                   lock.unlock()

//               }
//           }
//    }

    
    //MARK: - 3 // есть вероятность возникновения взаимной блокировки - deadlock. Можно решить с помощью добавления semaphore в метод walkPast
    
//    class ViewController: UIViewController {
//        var semaphore = DispatchSemaphore(value: 0)

//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            
//            var people1 = People1()
//            var people2 = People2()
//            
//            let thread1 = Thread {
//                people1.walkPast(with: people2, semaphore)
//            }
//
//            thread1.start()
//
//            let thread2 = Thread {
//                people2.walkPast(with: people1, semaphore)
//            }
//
//            thread2.start()
//        }
//     
//    }
//
//
//    class People1 {
//        var isDifferentDirections = false;
//
//        func walkPast(with people: People2, semaphore: DispatchSemaphore) {
//        semaphore.wait()
//            while (!people.isDifferentDirections) {
//                print("People1 не может обойти People2")
//                sleep(1)
//            }
//
//
//            print("People1 смог пройти прямо")
//            isDifferentDirections = true
//            semaphore.signal()
//        }
//    }
//
//    class People2 {
//        var isDifferentDirections = false;
//        
//        func walkPast(with people: People1, semaphore: DispatchSemaphore) {
//        semaphore.wait()

//            while (!people.isDifferentDirections) {
//                print("People2 не может обойти People1")
//                sleep(1)
//            }
//            
//            print("People2 смог пройти прямо")
//            isDifferentDirections = true
//            semaphore.signal()

//        }
//    }

    
    //MARK: - 4 в этом коде возникает проблема livelock - потому что создается 2 потока каждый из которых пятается захватить два семафора, но из -за отсутствия сихнронизации возникает конфликт захвата и оба потока будут бесконечно ожидать освобождения ресурсов. Для решения этой проблемы необходимо захватывать семафоры в одном и том же порядке
    
//    class RecipeViewController: UIViewController {
//        
//      
//        override func viewDidLoad() {
//            super.viewDidLoad()
//           
//            
//            DispatchQueue.global().async {
//                self.thread1()
//            }
//
//            DispatchQueue.global().async {
//                self.thread2()
//            }
//        }
//
//
//        let resourceASemaphore = DispatchSemaphore(value: 1)
//        let resourceBSemaphore = DispatchSemaphore(value: 1)
//
//        func thread1() {
//            print("Поток 1 пытается захватить Ресурс A")
//            resourceASemaphore.wait() // Захват Ресурса A
//            
//            print("Поток 1 захватил Ресурс A и пытается захватить Ресурс B")
//            Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
//            
//            //resourceBSemaphore.wait() // Попытка захвата Ресурса B, который уже занят Потоком 2
//            print("Поток 1 захватил Ресурс B")
//            
//            //resourceBSemaphore.signal()
//            resourceASemaphore.signal()
//        }
//
//        func thread2() {
//            print("Поток 2 пытается захватить Ресурс B")
//            resourceBSemaphore.wait() // Захват Ресурса B
//            
//            print("Поток 2 захватил Ресурс B и пытается захватить Ресурс A")
//            Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
//            
//           // resourceASemaphore.wait() // Попытка захвата Ресурса A, который уже занят Потоком 1
//            print("Поток 2 захватил Ресурс A")
//            
//            //resourceASemaphore.signal()
//            resourceBSemaphore.signal()
//        }
//    }

}
