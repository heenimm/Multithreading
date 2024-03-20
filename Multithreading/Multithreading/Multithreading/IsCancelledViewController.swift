//
//  IsCancelledViewController.swift
//  Multithreading
//
//  Created by Халимка on 20.03.2024.
//

import UIKit

class IsCancelledViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let infinityThread = InfinityLoop()
        infinityThread.start()
        sleep(2)
    }
}

class InfinityLoop: Thread {
    var counter = 0
    
    override func main() {
        while counter < 30 && !isCancelled {
            counter += 1
            print(counter)
            InfinityLoop.sleep(forTimeInterval: 1)
            if counter == 5 {
                cancel()
            }
        }
    }
}
