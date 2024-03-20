//
//  ThreadSanitizerViewController.swift
//  Multithreading
//
//  Created by Халимка on 20.03.2024.
//

import UIKit

class ThreadSanitizerViewController: UIViewController {

    private var name = "Введите имя"
    private let lock = DispatchQueue(label: "name.lock.queue")

        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateName()
        }
        
        func updateName() {
            lock.async {
                self.name = "I love RM"
                print(Thread.current)
                print(self.name)
            }
                
            lock.sync {
                print(self.name)
            }
        }
}

///Сначала вызывается метод updateName, далее внутри создается асинхронная задача
///которая выполняется в глобальной очереди и она обновляет переменную name затем
///асинхроннная задача завершается  и выводит текущий поток выполнения
///name.lock.queue - позволяет асинхронно установить значение переменной и синхронно вывести.
///Таким образом мы избегаем гонки данных
