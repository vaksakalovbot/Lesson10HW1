//
//  NetworkManager.swift
//  Lesson10HW1
//
//  Created by vaksakalov on 20.06.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static func fetchDataFromDictionaryApi(with word: String, completion: @escaping ([ModelJsonDictionaryApi]?, Error?, String?)->()) {
        
        let jsonUrl = "https://api.dictionaryapi.dev/api/v1/entries/en/\(word.trimmingCharacters(in: [" "]))"
        
        guard let url = URL(string: jsonUrl) else {
            completion(nil, nil, "Bad URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error, nil)
                return
            }
            
            guard let response = response else {
                print("response = nil")
                completion(nil, nil, "response = nil")
                return
            }
            print(response)
            
            guard let data = data else {
                print("data = nil")
                completion(nil, nil, "data = nil")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let modelJsonDictionaryApi = try decoder.decode([ModelJsonDictionaryApi].self, from: data)
                completion(modelJsonDictionaryApi, nil, nil)
            } catch let error {
                completion(nil, error, nil)
            }
            
        }.resume()
    }

}
