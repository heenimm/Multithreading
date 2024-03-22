//  ViewController.swift
// Copyright © RoadMap. All rights reserved.


import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Thread.detachNewThread {
            for _ in 0..<10 {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        }

        for _ in 0..<10 {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
    
}

