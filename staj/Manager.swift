//
//  Manager.swift
//  staj
//
//  Created by Isa Melsov on 2/3/24.
//

import Foundation

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
