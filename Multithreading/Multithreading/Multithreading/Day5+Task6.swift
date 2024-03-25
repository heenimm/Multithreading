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
                 await self.printHello()
            }
             group.addTask {
                await self.printMy()
            }
             group.addTask {
                 await self.printRoad()
            }
             group.addTask {
                 await self.printMap()
            }
             group.addTask {
                 await self.printGroup()
            }
            var collected = [String]()
            for await value in group  {
                collected.append(value)
            }
            return collected.joined(separator: " ")
        }
        print(string)
    }
    
    func printHello() async -> String {
       return "Hello"
    }
    
    func printMy() async -> String {
        return "My"
    }
    
    func printRoad() async -> String {
        return "Road"
    }
    
    func printMap() async -> String {
        return "Map"
    }
    
    func printGroup() async -> String {
        return "Group"
    }

}
