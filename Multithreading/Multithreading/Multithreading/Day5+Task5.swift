//
//  Day5+Task5.swift
//  Multithreading
//
//  Created by Халимка on 25.03.2024.
//

import UIKit

///Наберите задачу определите как она работает, отмените  задачу fetchTask
class Day5_Task5: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await getAverageTemperature()
        }
    }
    
    func getAverageTemperature() async {
        let fetchTask = Task { () -> Double in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            let sum = readings.reduce(0, +)
            return sum / Double(readings.count)
        }
        
        fetchTask.cancel()
        
        do {
            let result = try await fetchTask.value
            print("Average temperature:  \(result)")
        } catch {
            print("Failed to get data.")
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
