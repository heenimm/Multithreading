//
//  Day5+Task2.swift
//  Multithreading
//
//  Created by Халимка on 25.03.2024.
//

import UIKit

/// Task.detached(priority: .userInitiated, operation:  - создает асинхронную задачу в новой очереди, можно задать приоритет этой очереди для указания важности исполнения кода который она содержит
/// 
class Day5_Task2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Task 1 is finished")

        Task.detached(priority: .userInitiated, operation: {
            for i in 1..<50 {
                print(i)
            }
            print("Task 2 is finished")
            print(Thread.current)
        })
        print("Task 3 is finished")

    }
}
