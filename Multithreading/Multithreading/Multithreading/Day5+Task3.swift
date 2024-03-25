//
//  Day5+Task3.swift
//  Multithreading
//
//  Created by Халимка on 25.03.2024.
//

import UIKit

//Переведите  данный код на асинк авэйт
class Day5_Task3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func randomD6() -> Int {
            Int.random(in: 1...6)
        }
        
        let result =  randomD6()
        print(result)
        
    }
    
}
