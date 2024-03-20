//  PriorityViewController.swift
// Copyright © RoadMap. All rights reserved.



import UIKit

class PriorityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let thread1 = ThreadPrintDemon()
        let thread2 = ThreadPrintAngel()
        
        thread1.qualityOfService = .userInitiated
        thread2.qualityOfService = .utility
        
        thread1.start()
        thread2.start()
    }

}

class ThreadPrintDemon: Thread {
    override func main() {
        for _ in (0..<100) {
            print("1")
        }
    }
}

class ThreadPrintAngel: Thread {
    override func main() {
        for _ in (0..<100) {
            print("2")
        }
    }
}
