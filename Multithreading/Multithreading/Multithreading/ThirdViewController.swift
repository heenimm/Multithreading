//
//  ThirdViewController.swift
//  Multithreading
//
//  Created by Халимка on 20.03.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            DispatchQueue.main.sync {
                print(5)
            }
            print(4)
        }
        print(6)
    }
    
   
}

class VC: UIViewController {
    let vc = ThirdViewController()
    override func viewDidLoad() {
        print(1)
        let view = vc.view
        print(7)
    }
}

///Выводится  число 2 далее создается экземпляр класса и вызывается метод viewDidLoad потому что он часть жизненного цикла
///Далее запускается асинхронная задача на главной очереди (выводится 3) и синхронная задача блочит весь поток выполнения
//2,6,3 и deadlock

///
