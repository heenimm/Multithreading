//
//  Day5+Task6.swift
//  Multithreading
//
//  Created by Халимка on 25.03.2024.
//

import UIKit

class Day5_Task6: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await printMessage()
        }
    }
    

    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            group.addTask {
                "Hello"
            }
            group.addTask {
                "My"
            }
            group.addTask {
                "Road"
            }
            group.addTask {
                "Map"
            }
            group.addTask {
                "Group"
            }
            var collected = [String]()
            for await value in group  {
                collected.append(value)
            }
            return collected.joined(separator: " ")
        }
        print(string)
    }

}
