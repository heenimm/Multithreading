//
//  Day3+Task1.swift
//  Multithreading
//
//  Created by Халимка on 21.03.2024.
//

import UIKit

class Day3_Task1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let semaphore = DispatchSemaphore(value: 0)
        
        let phrasesService = PhrasesService()
        
        for i in 1..<10 {
            DispatchQueue.global().async {
                phrasesService.addPhrase("Phrase \(i)")
                print(Thread.current)
            }
        }
        Thread.sleep(forTimeInterval: 1)
        
        semaphore.wait()
//        print(phrasesService.phrases)
        semaphore.signal()
        
    }
    
}



actor PhrasesService {
    var phrases: [String] = []
    var semaphore = DispatchSemaphore(value: 1)
    
    
    func addPhrase(_ phrase: String) {
        semaphore.wait()
        phrases.append(phrase)
        semaphore.signal()
        
    }
}
