//
//  SecondThread.swift
//  Multithreading
//
//  Created by Халимка on 19.03.2024.
//

import UIKit

final class SecondThread: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем и запускаем второй поток с таймером
        let timerThread = TimerThread(duration: 10)
        timerThread.start()
    }
}

final class TimerThread: Thread {
        private var timerDuration: Int
        private var timer: Timer!
        
        init(duration: Int) {
            self.timerDuration = duration
        }
        
        override func main() {
            // Создаем таймер, который будет выполняться каждую секунду
            timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            // Добавляем таймер в текущий run loop
            RunLoop.current.add(timer, forMode: .default)
            
            // Запускаем текущий run loop
            RunLoop.current.run()
        }
        
        @objc func updateTimer() {
            // Ваш код здесь будет выполняться каждую секунду
            if timerDuration > 0 {
                print("Осталось \(timerDuration) секунд...")
                timerDuration -= 1
            } else {
                print("Время истекло!")
                
                timer.invalidate()
                // Остановка текущего run loop после завершения таймера
                CFRunLoopStop(CFRunLoopGetCurrent())
            }
        }
    }
