//
//  SanitizerViewController.swift
//  Multithreading
//
//  Created by Халимка on 20.03.2024.
//

import UIKit

class SanitizerViewController: UIViewController {
    
    private lazy var name = "I love RM"
    private let nameLock = NSLock()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
            self.nameLock.lock()
            print(self.name)
            print(Thread.current)
        }
        
        print(self.name)
    }
    
}

/// Проблема заключается в том что переменная name может быть изменена между моментом когда она
/// считывается в глобальном потоке и на основном потоке
/// Если заблокировать 
