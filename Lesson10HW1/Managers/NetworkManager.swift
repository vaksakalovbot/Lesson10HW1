//
//  NetworkManager.swift
//  Lesson10HW1
//
//  Created by vaksakalov on 20.06.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static func fetchDataFromDictionaryApi(with word: String, completion: @escaping ([ModelJsonDictionaryApi]?, Error?)->()) {
        
        let jsonUrlOne = "https://api.dictionaryapi.dev/api/v1/entries/en/\(word)"
        
        guard let url = URL(string: jsonUrlOne) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let response = response else { return }
            print(response)
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let modelJsonDictionaryApi = try decoder.decode([ModelJsonDictionaryApi].self, from: data)
                completion(modelJsonDictionaryApi, nil)
            } catch let error {
                completion(nil, error)
            }
            
        }.resume()
    }

}
