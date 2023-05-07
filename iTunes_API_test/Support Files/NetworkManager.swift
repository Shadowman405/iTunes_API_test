//
//  NetworkManager.swift
//  iTunes_API_test
//
//  Created by Maxim Mitin on 7.05.23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func callAPI(with completion: @escaping ([Response.Result]) -> ()){
        var returnResults = [Response.Result]()
        if let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson.") {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                
                if let data = data {
                    do {
                        let results = try decoder.decode(Response.self, from: data)
                        //print(results)
                        for result in results.results {
                            returnResults.append(result)
                            //print(result)
                            
                            DispatchQueue.main.async {
                                completion(returnResults)
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}
