//
//  QueueViewController.swift
//  Multithreading
//
//  Created by Халимка on 20.03.2024.
//

import UIKit

class QueueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("A")
        
        DispatchQueue.main.async {
            print("B")
        }
        print("C")
    }
    
}

/// ВЫвод ACB потому что первый и второй принт становятся в очередь первыми на главном потоке,
/// а вывод второго принта становится в очередь после
