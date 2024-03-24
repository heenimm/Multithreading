//
//  Day4+Task2.swift
//  Multithreading
//
//  Created by Халимка on 22.03.2024.
//

import UIKit

import Foundation

protocol RMOperationProtocol {
    var priority: DispatchQoS.QoSClass { get }
    var completionBlock: (() -> Void)? { get }
    var isFinished: Bool { get }
    func start()
}

class RMOperation: RMOperationProtocol {
    var priority: DispatchQoS.QoSClass = .default
    var completionBlock: (() -> Void)?
    private var finished: Bool = false
    var isFinished: Bool {
        return finished
    }
    
    func start() {
        DispatchQueue.global(qos: priority).async {
            self.main()
        }
    }
    
    private func main() {
        // Здесь выполняется основная работа операции
        for _ in 0..<50 {
            print("Operation executed")
        }
        
        // Помечаем операцию как завершенную
        finished = true
        
        // Вызываем блок завершения, если он был установлен
        completionBlock?()
    }
}

