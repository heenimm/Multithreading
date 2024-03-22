//
//  Day3+Task3+1.swift
//  Multithreading
//
//  Created by Халимка on 22.03.2024.
//

import UIKit

///В каком порядке отработают все принты
class Day3_Task3_1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("R")
        let lock = NSLock()
        DispatchQueue.global().async {
            lock.lock()
            print("A")
            
            lock.lock()
            print("D")
            
            DispatchQueue.main.async {
                print("Map")
            }
        }   
        print("O")
    }
}

///ROA
///Почему вывелись не все принты - потому что
///Исправить код чтобы вывелись все принты
