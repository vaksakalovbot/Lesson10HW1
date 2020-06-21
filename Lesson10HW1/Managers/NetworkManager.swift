//
//  NetworkManager.swift
//  Lesson10HW1
//
//  Created by vaksakalov on 20.06.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDataFromDictionaryApi(with word: String, completion: @escaping (String)->()) {
        
        let jsonUrl = "https://api.dictionaryapi.dev/api/v1/entries/en/\(word.trimmingCharacters(in: [" "]))"
        
        guard let url = URL(string: jsonUrl) else {
            completion("Error: bad URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            
            guard let response = response else {
                completion("Error: response = nil")
                return
            }
            print(response)
            
            guard let data = data else {
                completion("Error: data = nil")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let modelJsonDictionaryApi = try decoder.decode([ModelJsonDictionaryApi].self, from: data)
                completion("\(modelJsonDictionaryApi.first?.showResult() ?? "Nothing")")
            } catch let error {
                completion(error.localizedDescription)
            }
            
        }.resume()
    }

}
