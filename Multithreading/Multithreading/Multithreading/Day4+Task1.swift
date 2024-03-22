//
//  Day4+Task1.swift
//  Multithreading
//
//  Created by Халимка on 22.03.2024.
//

import UIKit

class Day4_Task1: UIViewController {

    class Post {
            
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
        

