//
//  Day4+Task1.swift
//  Multithreading
//
//  Created by Халимка on 22.03.2024.
//

import UIKit


///Ошибка возникает во втором случае потому что ассоциированное значение Post в State2. Протокол Sendable является частью моодели параллелизма в Swift и позволяет безопасно передавать данные между потоками. В данном случае Post не безопасный потому что не подписан на Sendable, а String автоматически подписан под данный протокол

class Day4_Task1: UIViewController {
    
    final class Post: Sendable {
        
    }
    
    enum State1: Sendable {
        case loading
        case data(String)
    }
    
    enum State2: Sendable {
        case loading
        case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }
    
}


