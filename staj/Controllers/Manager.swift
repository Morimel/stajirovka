//
//  Manager.swift
//  staj
//
//  Created by Isa Melsov on 2/3/24.
//

import Foundation

final class Manager {
    
    enum NetworkError: Error {
        case invalidURl, parseError, noData
    }
    
    static let shared = Manager()
    
    private init() {}
    
    let APIURL = URL(string: "https://rickandmortyapi.com/api/character")!
    
    func fetchImage(from url: URL, completion: @escaping (Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
    func fetchCharacters(completion: @escaping (Result<[Model], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: APIURL) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard let data else {
                completion(.failure(.noData))
                return
            }
            let decoder = JSONDecoder()
            do {
                let query = try decoder.decode(ModelArray.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(query.results))
                }
            } catch {
                completion(.failure(.parseError))
            }
        }.resume()
    }
    
    func fetchData() {
        if let url = URL(string: "https://rickandmortyapi.com/api/character") {
            let session = URLSession.shared
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                guard let responseData = data else {
                    print("No data")
                    return
                }
                do {
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        print("\(json)")
                    }
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
            
            task.resume()
        } else {
            print("error")
        }
    }
}

