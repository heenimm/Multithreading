//
//  Day3+Task1.swift
//  Multithreading
//
//  Created by Халимка on 21.03.2024.
//

import UIKit

actor Day3_Task1 {
    
    init() {
        var semaphore = DispatchSemaphore(value: 1)
        var phrasesService = PhrasesService()
        DispatchQueue.global.async {
            semaphore.wait()
            for i in 1..<10 {
                phrasesService.addPhrase("Phrase \(i)")
                
                semaphore.signal()
            }
            Thread.sleep(forTimeInterval: 1)
            print(phrasesService.phrases)
        }
    }
    
}
    

    
class PhrasesService {
    var phrases: [String] = []
    
    func addPhrase(_ phrase: String) {
        phrases.append(phrase)
    }
}
