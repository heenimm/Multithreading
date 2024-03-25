//
//  Day5+Task4.swift
//  Multithreading
//
//  Created by Халимка on 25.03.2024.
//

import UIKit
///Необходимо сетевой сервис его менять не нужно, все что содержится в Day5_Task4 должно работать на асинк /  эвэйт
///изменить fetchMessages(completion: @escaping ([Message]) -> Void)  на func fetchMessages() async -> [Message]] и содержимое метода перевести
///на асинк с помощью метода withCheckedContinuation

class Day5_Task4: UIViewController {
               
        var networkService = NetworkService()
        
        override func viewDidLoad() {
                super.viewDidLoad()
            
            fetchMessagesResult { message in
                print(message)
            }
           
        }
        
        func fetchMessagesResult(completion: @escaping ([Message]) -> Void) {
            networkService.fetchMessages { message in
                completion(message)
            }
        }
    }

    struct Message: Decodable, Identifiable {
        let id: Int
        let from: String
        let message: String
    }


    class NetworkService {
        
        func fetchMessages(completion: @escaping ([Message]) -> Void) {
            let url = URL(string: "https://hws.dev/user-messages.json")!

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                        completion(messages)
                        return
                    }
                }

                completion([])
            }
            .resume()
        }
    }

